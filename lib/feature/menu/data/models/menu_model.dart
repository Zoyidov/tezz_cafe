import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "name")
    required String name,
    @JsonKey(name: "image")
    required String image,
    @JsonKey(name: "cafe")
    required int cafe,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) => _$MenuModelFromJson(json);
}
