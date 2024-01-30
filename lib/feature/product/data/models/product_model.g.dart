// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      desc: json['desc'] as String,
      menuId: json['menu_id'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'desc': instance.desc,
      'menu_id': instance.menuId,
    };
