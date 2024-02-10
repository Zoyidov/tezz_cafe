import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';
@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: "id")
    required int id,
    @JsonKey(name: "table")
    required int table,
    @JsonKey(name: "waitress")
    required int waitress,
    @JsonKey(name: "created_at")
    required DateTime createdAt,
    @JsonKey(name: "total_price")
    required String totalPrice,
    @JsonKey(name: "cafe")
    required int cafe,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
}
