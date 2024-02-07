part of 'waitress_bloc.dart';

abstract class WaitressEvent {}
class WaitressInitial extends WaitressEvent {}
class GetWaitressEvent extends WaitressEvent {
  String token;

  GetWaitressEvent(this.token);
}
