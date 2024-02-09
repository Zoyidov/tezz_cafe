part of 'order_bloc.dart';

abstract class OrderEvent {}

class GetOrdersEvent extends OrderEvent {
  final String token ;
  final TableModel table;

  GetOrdersEvent(this.token, this.table);


}