import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';

part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "image") required String image,
    @JsonKey(name: "kafe_id") required String kafeId,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);
}
