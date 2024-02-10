import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_model.freezed.dart';

part 'zone_model.g.dart';

@freezed
class ZoneModel with _$ZoneModel {
  const factory ZoneModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "cafe") required int cafe,
  }) = _ZoneModel;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => _$ZoneModelFromJson(json);
}
