// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PinPointImpl _$$PinPointImplFromJson(Map<String, dynamic> json) =>
    _$PinPointImpl(
      id: json['id'] as String?,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      geoTagging: json['geoTagging'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PinPointImplToJson(_$PinPointImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'long': instance.long,
      'geoTagging': instance.geoTagging,
    };
