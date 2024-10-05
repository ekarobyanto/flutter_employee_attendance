import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/config/repository_config.dart';
import 'package:user_attendance/models/pinpoint.dart';
import 'package:user_attendance/providers/firestore_provider.dart';
import 'package:geocoding/geocoding.dart';

part 'pinpoint_repository.g.dart';

class PinPointRepository extends Repository {
  PinPointRepository({required super.firestoreInstance});

  addPinPoint(PinPoint pinPoint) async {
    await this
        .firestoreInstance!
        .collection('pinPoints')
        .add(pinPoint.toJson());
  }

  Future<List<PinPoint>> getPinPoints() async =>
      this.firestoreInstance!.collection('pinPoints').get().then(
            (value) => value.docs
                .map((doc) => PinPoint.fromJson({
                      ...doc.data(),
                      "id": doc.id,
                    }))
                .toList(),
          );

  Future<List<Placemark>> getGeoTagging(LatLng latlng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    return placemarks;
  }
}

@riverpod
PinPointRepository pinPointRepository(PinPointRepositoryRef ref) =>
    PinPointRepository(firestoreInstance: ref.read(firestoreInstanceProvider));
