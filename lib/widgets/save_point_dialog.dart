import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_attendance/models/pinpoint.dart';
import 'package:user_attendance/providers/geotag_provider.dart';

class SavePointDialog extends ConsumerWidget {
  const SavePointDialog({
    super.key,
    required this.point,
    required this.onSave,
  });

  final LatLng point;
  final Function(PinPoint point) onSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geoTag = ref.watch(geotaggingProvider(point));
    final geoTagData = geoTag.whenOrNull(data: (data) => data);
    return AlertDialog(
      title: const Text("Save Point"),
      content: LimitedBox(
        maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Do you want to save this point?"),
              const SizedBox(height: 10),
              Text("Latitude: ${point.latitude}"),
              const SizedBox(height: 10),
              Text("Longitude: ${point.longitude}"),
              const SizedBox(height: 10),
              geoTag.when(
                data: (data) =>
                    Text("Location: ${data.street}, ${data.country}"),
                loading: () => const CircularProgressIndicator(),
                error: (error, _) => Text("Error: $error"),
              ),
            ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.all(5),
      actions: [
        if (geoTagData != null)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onSave(
                PinPoint(
                  lat: point.latitude,
                  long: point.longitude,
                  geoTagging: geoTagData.toJson(),
                ),
              );
            },
            child: const Text("Save"),
          ),
      ],
    );
  }
}
