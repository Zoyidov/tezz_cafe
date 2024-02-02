part of 'menu_bloc.dart';

abstract class MenuEvent {}

class GetMenuItems extends MenuEvent {}

class ScrollUp extends MenuEvent {}

class ScrollDown extends MenuEvent {}