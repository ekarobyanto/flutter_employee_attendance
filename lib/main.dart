import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_attendance/enum/attendance_mode.dart';
import 'package:user_attendance/firebase_options.dart';
import 'package:user_attendance/models/absence.dart';
import 'package:user_attendance/models/pinpoint.dart';
import 'package:user_attendance/providers/absence.dart';
import 'package:user_attendance/providers/absence_notifier.dart';
import 'package:user_attendance/providers/add_point_notifier.dart';
import 'package:user_attendance/providers/firestore_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:user_attendance/providers/point_provider.dart';
import 'package:user_attendance/widgets/attendance_button.dart';
import 'package:user_attendance/widgets/attendance_button_bar.dart';
import 'package:user_attendance/widgets/save_point_dialog.dart';
import 'package:user_attendance/widgets/username_input_dialog.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class _ProvidersInitializer extends ConsumerWidget {
  const _ProvidersInitializer({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(firestoreInstanceProvider);
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _ProvidersInitializer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const AttendanceApp(),
      ),
    );
  }
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MapView();
  }
}

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _ConsumerMapViewState();
}

class _ConsumerMapViewState extends ConsumerState<MapView> {
  LatLng _userPosition = const LatLng(0, 0);
  bool _permissionGranted = false;
  AttendanceMode _currentAttendanceMode = AttendanceMode.addPoint;
  GoogleMapController? _mapController;
  LatLng? _point;

  @override
  void initState() {
    super.initState();
    _checkAndRequestLocationPermission();
    ref.listenManual(addPointNotifierProvider, (_, state) {
      state.whenOrNull(
        data: (success) {
          if (success) {
            ref.invalidate(pointsProvider);
            setState(() => _point = null);
          }
        },
        error: (err, _) => print(err.toString()),
      );
    });
    ref.listenManual(absenceNotifierProvider, (_, state) {
      state.whenOrNull(
        data: (success) {
          if (success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Absence Recorded")),
            );
          }
        },
        error: (err, _) => print(err.toString()),
      );
    });
  }

  Future<void> _checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      _onPermissionGranted();
    } else {
      print("Location permission denied");
    }
  }

  Future<void> _onPermissionGranted() async {
    setState(() => _permissionGranted = true);
    _startLocationUpdates();
  }

  void _startLocationUpdates() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 1,
      ),
    ).listen((Position position) {
      LatLng newUserPosition = LatLng(position.latitude, position.longitude);
      _moveCameraToPosition(newUserPosition);
      setState(() {
        _userPosition = newUserPosition;
      });
    });
  }

  void _moveCameraToPosition(LatLng position) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  void _changeAttendanceMode(AttendanceMode mode) {
    setState(() {
      _point = null;
      _currentAttendanceMode = mode;
    });
  }

  _savePoints() => showDialog(
        context: context,
        builder: (_) => SavePointDialog(
          point: _point!,
          onSave: (v) =>
              ref.read(addPointNotifierProvider.notifier).submitPoint(v),
        ),
      );

  Set<Marker> _buildMarkers(List<PinPoint>? savedPoints, LatLng? currentPoint) {
    final savedMarkers = savedPoints
            ?.map((point) => Marker(
                  markerId: MarkerId(point.id ?? ''),
                  position: LatLng(point.lat, point.long),
                ))
            .toSet() ??
        {};

    final currentMarker = currentPoint != null
        ? Marker(
            markerId: MarkerId(currentPoint.toString()),
            position: currentPoint,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          )
        : null;

    return {
      ...savedMarkers,
      if (currentMarker != null) currentMarker,
    };
  }

  _absence(List<PinPoint> savedPoints) async {
    double closestDistance = double.infinity;
    PinPoint? nearestPoint;

    for (var point in savedPoints) {
      double distance = Geolocator.distanceBetween(
        _userPosition.latitude,
        _userPosition.longitude,
        point.lat,
        point.long,
      );

      if (distance < closestDistance) {
        closestDistance = distance;
        nearestPoint = point;
      }
    }

    if (closestDistance > 50 || nearestPoint == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('No Nearby Points'),
          content: const Text(
              'There are no points within 50 meters of your location.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      final pref = await SharedPreferences.getInstance();
      var name = pref.getString('username');
      name ??= await showDialog(
        context: context,
        builder: (_) => const UsernameInputDialog(),
      );
      pref.setString('username', name!);

      ref.read(absenceNotifierProvider.notifier).submitAbsence(
            Absence(
              username: name,
              point: nearestPoint,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final savedPoints =
        ref.watch(pointsProvider).whenOrNull(data: (data) => data);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: _permissionGranted,
                  onTap: (latlng) {
                    if (_currentAttendanceMode == AttendanceMode.addPoint) {
                      setState(() => _point = latlng);
                    }
                  },
                  markers: _buildMarkers(savedPoints, _point),
                  initialCameraPosition: CameraPosition(
                    zoom: 14.0,
                    target: _userPosition,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                    if (_permissionGranted) {
                      _moveCameraToPosition(_userPosition);
                    }
                  },
                ),
                if (_point != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        AttendanceButton(
                          label: "Save",
                          isSelected: true,
                          onPressed: _savePoints,
                        ),
                        const SizedBox(width: 10),
                        AttendanceButton(
                          label: "Delete",
                          isSelected: false,
                          onPressed: () => setState(() => _point = null),
                        ),
                      ],
                    ),
                  ),
                if (_currentAttendanceMode == AttendanceMode.absence)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AttendanceButton(
                        label: "Absence",
                        isSelected: true,
                        onPressed: () => _absence(savedPoints ?? []),
                      ),
                      const SizedBox(width: 10),
                      AttendanceButton(
                        label: "Data",
                        isSelected: false,
                        onPressed: () => showDialog(
                          context: context,
                          builder: (_) => const AbsenceDataDialog(),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          AttendanceButtonBar(
            mode: _currentAttendanceMode,
            onModeChange: _changeAttendanceMode,
          ),
        ],
      ),
    );
  }
}

class AbsenceDataDialog extends ConsumerWidget {
  const AbsenceDataDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Absence> absences = ref
        .watch(abcencesProvider)
        .maybeWhen(orElse: () => [], data: (data) => data);
    return AlertDialog(
      title: const Text("Absences"),
      backgroundColor: Colors.white,
      content: LimitedBox(
        maxHeight: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(absences.length, (index) {
            final geo = Placemark.fromMap(absences[index].point.geoTagging);
            print(geo);
            return Column(
              children: [
                Text(absences[index].username),
                Text("${geo.street}, ${geo.country}"),
                const Divider(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
