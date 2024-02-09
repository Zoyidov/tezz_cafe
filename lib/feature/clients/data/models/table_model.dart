import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "number")
    required String number,
    @JsonKey(name: "capacity")
    required int capacity,
    @JsonKey(name: "active")
    required bool active,
    @JsonKey(name: "total_price")
    required int totalPrice,
    @JsonKey(name: "zone")
    required int zone,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);
}
