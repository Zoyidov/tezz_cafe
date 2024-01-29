part of 'client_tab_bloc.dart';

abstract class ClientTabEvent {}

class TabChanged extends ClientTabEvent {
  final int index;

  TabChanged({required this.index});
}

class PageChanged extends ClientTabEvent {
  final int index;

  PageChanged({required this.index});
}
