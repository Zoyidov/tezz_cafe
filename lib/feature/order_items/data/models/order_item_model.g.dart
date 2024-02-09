// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as int,
      order: json['order'] as int,
      product: json['product'] as String,
      quantity: json['quantity'] as int,
      notes: json['notes'] as String,
      price: json['price'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      productOriginalPrice: json['product_original_price'] as int,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'product': instance.product,
      'quantity': instance.quantity,
      'notes': instance.notes,
      'price': instance.price,
      'created_at': instance.createdAt.toIso8601String(),
      'product_original_price': instance.productOriginalPrice,
    };
