import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/repository/pinpoint_repository.dart';

part 'geotag_provider.g.dart';

@riverpod
Future<Placemark> geotagging(GeotaggingRef ref, LatLng latlng) async {
  return ref
      .read(pinPointRepositoryProvider)
      .getGeoTagging(latlng)
      .then((value) => value.first);
}
