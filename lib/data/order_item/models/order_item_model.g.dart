// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: json['id'] as int?,
      order: json['order'] as int?,
      product: json['product'] as String?,
      quantity: json['quantity'] as int?,
      notes: json['notes'] as String?,
      price: json['price'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      productOriginalPrice: json['product_original_price'] as int?,
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'product': instance.product,
      'quantity': instance.quantity,
      'notes': instance.notes,
      'price': instance.price,
      'created_at': instance.createdAt?.toIso8601String(),
      'product_original_price': instance.productOriginalPrice,
    };
