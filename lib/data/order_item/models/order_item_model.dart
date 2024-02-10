import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "order")
    int? order,
    @JsonKey(name: "product")
    String? product,
    @JsonKey(name: "quantity")
    int? quantity,
    @JsonKey(name: "notes")
    String? notes,
    @JsonKey(name: "price")
    String? price,
    @JsonKey(name: "created_at")
    DateTime? createdAt,
    @JsonKey(name: "product_original_price")
    int? productOriginalPrice,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);
}
