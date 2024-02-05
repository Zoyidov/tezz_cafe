import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone_model.freezed.dart';

part 'zone_model.g.dart';

@freezed
class ZoneModel with _$ZoneModel {
  const factory ZoneModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "kafe_id") required String kafeId,
  }) = _ZoneModel;

  factory ZoneModel.fromJson(Map<String, dynamic> json) => _$ZoneModelFromJson(json);
}
