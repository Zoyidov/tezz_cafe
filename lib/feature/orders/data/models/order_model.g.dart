// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['_id'] as String,
      productId: json['product_id'] as String,
      stolId: json['stol_id'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product_id': instance.productId,
      'stol_id': instance.stolId,
      'count': instance.count,
    };
