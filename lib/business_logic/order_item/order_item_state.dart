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

  int get totalPrice => orderItems.fold(0, (previousValue, element) => previousValue + int.parse(element.price ?? '0'));

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
