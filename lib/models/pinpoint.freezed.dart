// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pinpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PinPoint _$PinPointFromJson(Map<String, dynamic> json) {
  return _PinPoint.fromJson(json);
}

/// @nodoc
mixin _$PinPoint {
  String? get id => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  Map<String, dynamic>? get geoTagging => throw _privateConstructorUsedError;

  /// Serializes this PinPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PinPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PinPointCopyWith<PinPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinPointCopyWith<$Res> {
  factory $PinPointCopyWith(PinPoint value, $Res Function(PinPoint) then) =
      _$PinPointCopyWithImpl<$Res, PinPoint>;
  @useResult
  $Res call(
      {String? id, double lat, double long, Map<String, dynamic>? geoTagging});
}

/// @nodoc
class _$PinPointCopyWithImpl<$Res, $Val extends PinPoint>
    implements $PinPointCopyWith<$Res> {
  _$PinPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PinPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lat = null,
    Object? long = null,
    Object? geoTagging = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      geoTagging: freezed == geoTagging
          ? _value.geoTagging
          : geoTagging // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PinPointImplCopyWith<$Res>
    implements $PinPointCopyWith<$Res> {
  factory _$$PinPointImplCopyWith(
          _$PinPointImpl value, $Res Function(_$PinPointImpl) then) =
      __$$PinPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, double lat, double long, Map<String, dynamic>? geoTagging});
}

/// @nodoc
class __$$PinPointImplCopyWithImpl<$Res>
    extends _$PinPointCopyWithImpl<$Res, _$PinPointImpl>
    implements _$$PinPointImplCopyWith<$Res> {
  __$$PinPointImplCopyWithImpl(
      _$PinPointImpl _value, $Res Function(_$PinPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of PinPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lat = null,
    Object? long = null,
    Object? geoTagging = freezed,
  }) {
    return _then(_$PinPointImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      geoTagging: freezed == geoTagging
          ? _value._geoTagging
          : geoTagging // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PinPointImpl implements _PinPoint {
  const _$PinPointImpl(
      {this.id,
      required this.lat,
      required this.long,
      final Map<String, dynamic>? geoTagging})
      : _geoTagging = geoTagging;

  factory _$PinPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PinPointImplFromJson(json);

  @override
  final String? id;
  @override
  final double lat;
  @override
  final double long;
  final Map<String, dynamic>? _geoTagging;
  @override
  Map<String, dynamic>? get geoTagging {
    final value = _geoTagging;
    if (value == null) return null;
    if (_geoTagging is EqualUnmodifiableMapView) return _geoTagging;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PinPoint(id: $id, lat: $lat, long: $long, geoTagging: $geoTagging)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinPointImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            const DeepCollectionEquality()
                .equals(other._geoTagging, _geoTagging));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lat, long,
      const DeepCollectionEquality().hash(_geoTagging));

  /// Create a copy of PinPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PinPointImplCopyWith<_$PinPointImpl> get copyWith =>
      __$$PinPointImplCopyWithImpl<_$PinPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PinPointImplToJson(
      this,
    );
  }
}

abstract class _PinPoint implements PinPoint {
  const factory _PinPoint(
      {final String? id,
      required final double lat,
      required final double long,
      final Map<String, dynamic>? geoTagging}) = _$PinPointImpl;

  factory _PinPoint.fromJson(Map<String, dynamic> json) =
      _$PinPointImpl.fromJson;

  @override
  String? get id;
  @override
  double get lat;
  @override
  double get long;
  @override
  Map<String, dynamic>? get geoTagging;

  /// Create a copy of PinPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PinPointImplCopyWith<_$PinPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
