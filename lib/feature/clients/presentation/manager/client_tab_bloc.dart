import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'client_tab_event.dart';

part 'client_tab_state.dart';

class ClientTabBloc extends Bloc<ClientTabEvent, ClientTabState> {
  final List<String> tabs = ['Zall', 'Kabina', 'Terassa'];
  final PageController pageController = PageController();

  ClientTabBloc() : super(const ClientTabState()) {
    on<TabChanged>(_tabChanged);
    on<PageChanged>(_pageChanged);
  }

  void _pageChanged(PageChanged event, Emitter<ClientTabState> emit) {
    List<bool> updatedSelection = List.from(state.isSelected);
    for (int i = 0; i < updatedSelection.length; i++) {
      updatedSelection[i] = i == event.index;
    }

    emit(state.copyWith(clientTabIndex: event.index, isSelected: updatedSelection));
  }

  void _tabChanged(TabChanged event, Emitter<ClientTabState> emit) {
    List<bool> updatedSelection = List.from(state.isSelected);
    for (int i = 0; i < updatedSelection.length; i++) {
      updatedSelection[i] = i == event.index;
    }
    emit(state.copyWith(clientTabIndex: event.index, isSelected: updatedSelection));
    pageController.jumpToPage(event.index);
  }
}
