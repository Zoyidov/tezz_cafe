part of 'order_bloc.dart';

abstract class OrderEvent {}

class FetchOrdersByCafeIdEvent extends OrderEvent {
  final String  cafeId;
  final String waitressId;

  FetchOrdersByCafeIdEvent(this.cafeId, this.waitressId);
}
