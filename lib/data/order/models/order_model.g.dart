// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as int,
      table: json['table'] as int,
      waitress: json['waitress'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      totalPrice: json['total_price'] as String,
      cafe: json['cafe'] as int,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table': instance.table,
      'waitress': instance.waitress,
      'created_at': instance.createdAt.toIso8601String(),
      'total_price': instance.totalPrice,
      'cafe': instance.cafe,
    };
