part of 'order_bloc.dart';

class OrderState {
  final FormzSubmissionStatus status;
  final List<OrderModel> orders;
  final String message;

  OrderState({
    this.status = FormzSubmissionStatus.initial,
    this.orders = const [],
    this.message = '',
  });

  OrderState copyWith({
    FormzSubmissionStatus? status,
    List<OrderModel>? orders,
    String? message,
  }) {
    return OrderState(
      status: status ?? this.status,
      orders: orders ?? this.orders,
      message: message ?? this.message,
    );
  }
}
