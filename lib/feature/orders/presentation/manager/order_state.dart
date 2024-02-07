part of 'order_bloc.dart';

class OrderState {
  final FormzSubmissionStatus status;
  final List<OrderModel> orders;
  final List<OrderModel> filteredOrders;
  final String message;

  const OrderState({
    this.status = FormzSubmissionStatus.initial,
    this.orders = const [],
    this.filteredOrders = const [],
    this.message = '',
  });

  OrderState copyWith({
    FormzSubmissionStatus? status,
    List<OrderModel>? orders,
    List<OrderModel>? filteredOrders,
    String? message,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      filteredOrders: filteredOrders ?? this.filteredOrders,
      message: message ?? this.message,
    );
  }
}
