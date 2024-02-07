import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_model.freezed.dart';

part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "stol_nomi") required String stolNomi,
    @JsonKey(name: "QR") required String qr,
    @JsonKey(name: "active") required bool active,
    @JsonKey(name: "kafe_id") required String kafeId,
    @JsonKey(name: "zone_id") required String zoneId,
    @JsonKey(name: "ofisiant_id")  String? ofisiantId,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);
}
