// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: json['_id'] as String,
      stolNomi: json['stol_nomi'] as String,
      qr: json['QR'] as String,
      active: json['active'] as bool,
      kafeId: json['kafe_id'] as String,
      zoneId: json['zone_id'] as String,
      ofisiantId: json['ofisiant_id'] as String,
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stol_nomi': instance.stolNomi,
      'QR': instance.qr,
      'active': instance.active,
      'kafe_id': instance.kafeId,
      'zone_id': instance.zoneId,
      'ofisiant_id': instance.ofisiantId,
    };
