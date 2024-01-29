import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ScrollController scrollController = ScrollController();

  MenuBloc() : super(const MenuState()) {
    on<MenuEvent>((event, emit) {});
    on<ScrollUp>(_onScrollUp);
    on<ScrollDown>(_onScrollDown);
    scrollController.addListener(_onScroll);
  }

  void _onScrollUp(MenuEvent event, Emitter<MenuState> emit) {
    emit(state.copyWith(isVisible: true));
  }

  void _onScrollDown(MenuEvent event, Emitter<MenuState> emit) {
    emit(state.copyWith(isVisible: false));
  }

  void _onScroll() {
    // when scroll up emit visible false
    if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      print('forward');
      // Scroll down, show FloatingActionButton
      if (!state.isVisible) {
        add(ScrollUp());
      }
    } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      print('reverse');
      // Scroll up, hide FloatingActionButton
      if (state.isVisible) {
        add(ScrollDown());
      }
    }
  }
}
