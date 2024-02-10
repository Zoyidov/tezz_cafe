part of 'order_item_bloc.dart';

class OrderItemState {
  final FormzSubmissionStatus status;
  final List<OrderItemModel> orderItems;
  final String message;

  const OrderItemState({
    this.status = FormzSubmissionStatus.initial,
    this.orderItems = const [],
    this.message = '',
  });

  OrderItemState copyWith({
    FormzSubmissionStatus? status,
    List<OrderItemModel>? orderItems,
    String? message,
  }) {
    return OrderItemState(
      status: status ?? this.status,
      orderItems: orderItems ?? this.orderItems,
      message: message ?? this.message,
    );
  }
}
