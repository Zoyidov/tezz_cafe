import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "order")
    required int order,
    @JsonKey(name: "product")
    required String product,
    @JsonKey(name: "quantity")
    required int quantity,
    @JsonKey(name: "notes")
    required String notes,
    @JsonKey(name: "price")
    required String price,
    @JsonKey(name: "created_at")
    required DateTime createdAt,
    @JsonKey(name: "product_original_price")
    required int productOriginalPrice,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}
