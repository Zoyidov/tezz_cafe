import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(name: "product_id")
    required String productId,
    @JsonKey(name: "stol_id")
    required String stolId,
    @JsonKey(name: "count")
    required int count,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}
