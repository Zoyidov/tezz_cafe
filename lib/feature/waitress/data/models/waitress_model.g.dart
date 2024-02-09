// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaitressModelImpl _$$WaitressModelImplFromJson(Map<String, dynamic> json) =>
    _$WaitressModelImpl(
      id: json['id'] as int,
      user: json['user'] as String,
      contactNumber: json['contact_number'] as String,
      employeeId: json['employee_id'] as String,
      cafe: json['cafe'] as int,
    );

Map<String, dynamic> _$$WaitressModelImplToJson(_$WaitressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'contact_number': instance.contactNumber,
      'employee_id': instance.employeeId,
      'cafe': instance.cafe,
    };
