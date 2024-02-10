import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/menu/models/menu_model.dart';
import 'package:tezz_cafe/data/menu/repositories/menu_repo_impl.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final ScrollController scrollController = ScrollController();
  final MenuRepository menuRepository = getIt<MenuRepositoryImpl>();

  MenuBloc() : super(const MenuState()) {
    on<ScrollUp>(_onScrollUp);
    on<ScrollDown>(_onScrollDown);
    on<GetMenuItems>(_onGetMenuItems);

    scrollController.addListener(_onScroll);
  }

  void _onGetMenuItems(GetMenuItems event, Emitter<MenuState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await menuRepository.getMenuItems(event.cafeId);

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
      // Scroll down, show FloatingActionButton
      if (!state.isVisible) {
        add(ScrollUp());
      }
    } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // Scroll up, hide FloatingActionButton
      if (state.isVisible) {
        add(ScrollDown());
      }
    }
  }
}
