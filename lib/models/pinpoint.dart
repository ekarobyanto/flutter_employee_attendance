// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pinpoint.g.dart';
part 'pinpoint.freezed.dart';

@freezed
class PinPoint with _$PinPoint {
  const factory PinPoint({
    String? id,
    required double lat,
    required double long,
    Map<String, dynamic>? geoTagging,
  }) = _PinPoint;

  factory PinPoint.fromJson(Map<String, dynamic> json) =>
      _$PinPointFromJson(json);
}
