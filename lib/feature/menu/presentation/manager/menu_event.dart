part of 'menu_bloc.dart';

abstract class MenuEvent {

}

class GetMenuItems extends MenuEvent {
  String cafeId;

  GetMenuItems(this.cafeId);
}

class ScrollUp extends MenuEvent {}

class ScrollDown extends MenuEvent {}


