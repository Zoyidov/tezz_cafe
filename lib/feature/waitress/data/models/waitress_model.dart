import 'package:freezed_annotation/freezed_annotation.dart';

part 'waitress_model.freezed.dart';

part 'waitress_model.g.dart';

@freezed
class WaitressModel with _$WaitressModel {
  const factory WaitressModel({
    @JsonKey(name: "attachedStol") required List<ActiveStol> attachedStol,
    @JsonKey(name: "activeStol") required List<ActiveStol> activeStol,
    @JsonKey(name: "allStol") required List<ActiveStol> allStol,
    @JsonKey(name: "noActive") required List<ActiveStol> noActive,
    @JsonKey(name: "ofisiant") required Ofisiant ofisiant,
  }) = _WaitressModel;

  factory WaitressModel.fromJson(Map<String, dynamic> json) => _WaitressModel.fromJson(json);
}

// "code": 1234,
//                 "xizmat_id": "65c2a709b6b3a96794261d0a"
@freezed
class ActiveStol with _$ActiveStol {
  const factory ActiveStol({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "stol_nomi") required String stolNomi,
    @JsonKey(name: "QR") required String qr,
    @JsonKey(name: "active") required bool active,
    @JsonKey(name: "kafe_id") required String kafeId,
    @JsonKey(name: "zone_id") required String zoneId,
    @JsonKey(name: "ofisiant_id")   String?   ofisiantId,
    @JsonKey(name: "code") int?   code,
    @JsonKey(name: "xizmat_id") String? xizmatId,
  }) = _ActiveStol;

  factory ActiveStol.fromJson(Map<String, dynamic> json) => _ActiveStol.fromJson(json);
}

@freezed
class Ofisiant with _$Ofisiant {
  const factory Ofisiant({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "kafe_id") required String kafeId,
    @JsonKey(name: "admin_id") required String adminId,
  }) = _Ofisiant;

  factory Ofisiant.fromJson(Map<String, dynamic> json) => _Ofisiant.fromJson(json);
}
