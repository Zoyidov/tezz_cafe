part of 'table_bloc.dart';

abstract class TableEvent {}

class GetTablesByCafeEvent extends TableEvent {
  final String cafeId;

  GetTablesByCafeEvent(this.cafeId);
}
