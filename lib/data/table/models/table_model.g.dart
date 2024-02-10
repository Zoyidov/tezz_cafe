// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableModelImpl _$$TableModelImplFromJson(Map<String, dynamic> json) =>
    _$TableModelImpl(
      id: json['id'] as int,
      number: json['number'] as String,
      capacity: json['capacity'] as int,
      active: json['active'] as bool,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      zone: json['zone'] as int,
    );

Map<String, dynamic> _$$TableModelImplToJson(_$TableModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'capacity': instance.capacity,
      'active': instance.active,
      'total_price': instance.totalPrice,
      'zone': instance.zone,
    };
