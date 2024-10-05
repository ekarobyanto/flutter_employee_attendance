import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_attendance/models/pinpoint.dart';

part 'absence.g.dart';
part 'absence.freezed.dart';

@freezed
class Absence with _$Absence {
  @JsonSerializable(explicitToJson: true)
  const factory Absence({
    required String username,
    required PinPoint point,
  }) = _Absence;

  factory Absence.fromJson(Map<String, dynamic> json) =>
      _$AbsenceFromJson(json);
}
