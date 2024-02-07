// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaitressModelImpl _$$WaitressModelImplFromJson(Map<String, dynamic> json) =>
    _$WaitressModelImpl(
      attachedStol: (json['attachedStol'] as List<dynamic>)
          .map((e) => ActiveStol.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeStol: (json['activeStol'] as List<dynamic>)
          .map((e) => ActiveStol.fromJson(e as Map<String, dynamic>))
          .toList(),
      allStol: (json['allStol'] as List<dynamic>)
          .map((e) => ActiveStol.fromJson(e as Map<String, dynamic>))
          .toList(),
      noActive: (json['noActive'] as List<dynamic>)
          .map((e) => ActiveStol.fromJson(e as Map<String, dynamic>))
          .toList(),
      ofisiant: Ofisiant.fromJson(json['ofisiant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WaitressModelImplToJson(_$WaitressModelImpl instance) =>
    <String, dynamic>{
      'attachedStol': instance.attachedStol,
      'activeStol': instance.activeStol,
      'allStol': instance.allStol,
      'noActive': instance.noActive,
      'ofisiant': instance.ofisiant,
    };

_$ActiveStolImpl _$$ActiveStolImplFromJson(Map<String, dynamic> json) =>
    _$ActiveStolImpl(
      id: json['_id'] as String,
      stolNomi: json['stol_nomi'] as String,
      qr: json['QR'] as String,
      active: json['active'] as bool,
      kafeId: json['kafe_id'] as String,
      zoneId: json['zone_id'] as String,
      ofisiantId: json['ofisiant_id'] as String?,
      code: json['code'] as int?,
      xizmatId: json['xizmat_id'] as String?,
    );

Map<String, dynamic> _$$ActiveStolImplToJson(_$ActiveStolImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'stol_nomi': instance.stolNomi,
      'QR': instance.qr,
      'active': instance.active,
      'kafe_id': instance.kafeId,
      'zone_id': instance.zoneId,
      'ofisiant_id': instance.ofisiantId,
      'code': instance.code,
      'xizmat_id': instance.xizmatId,
    };

_$OfisiantImpl _$$OfisiantImplFromJson(Map<String, dynamic> json) =>
    _$OfisiantImpl(
      id: json['_id'] as String,
      username: json['username'] as String,
      kafeId: json['kafe_id'] as String,
      adminId: json['admin_id'] as String,
    );

Map<String, dynamic> _$$OfisiantImplToJson(_$OfisiantImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'kafe_id': instance.kafeId,
      'admin_id': instance.adminId,
    };
