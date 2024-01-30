import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/feature/menu/data/models/menu_model.dart';
import 'package:tezz_cafe/feature/menu/domain/use_cases/get_menu_items_use_case.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ScrollController scrollController = ScrollController();
  final GetMenuItemsUseCase getMenuItemsUseCase;

  MenuBloc(this.getMenuItemsUseCase) : super(const MenuState()) {
    on<MenuEvent>((event, emit) {});
    on<ScrollUp>(_onScrollUp);
    on<ScrollDown>(_onScrollDown);
    on<GetMenuItems>(_onGetMenuItems);
    scrollController.addListener(_onScroll);
  }

  void _onGetMenuItems(MenuEvent event, Emitter<MenuState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await getMenuItemsUseCase.execute(NoParams());
    result.fold(
      (l) => emit(state.copyWith(status: FormzSubmissionStatus.failure, error: l.message)),
      (r) => emit(state.copyWith(status: FormzSubmissionStatus.success, menuItems: r)),
    );
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
