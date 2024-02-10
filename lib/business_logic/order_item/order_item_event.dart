part of 'order_item_bloc.dart';

abstract class OrderItemEvent {}

class FetchOrderItemsEvent extends OrderItemEvent {
  final String orderId;

  FetchOrderItemsEvent(this.orderId);
}
