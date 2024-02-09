// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuModelImpl _$$MenuModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      cafe: json['cafe'] as int,
    );

Map<String, dynamic> _$$MenuModelImplToJson(_$MenuModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'cafe': instance.cafe,
    };
