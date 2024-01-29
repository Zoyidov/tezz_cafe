import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState());

  void changeTab(int tabIndex) {
    emit(state.copyWith(index: tabIndex));
  }

  void changeMessageState(bool isActive) {
    emit(state.copyWith(isActive: isActive));
  }
}

class TabState {
  final int index;
  final bool isActive;

  TabState({
    this.index = 0,
    this.isActive = false,
  });

  TabState copyWith({
    int? index,
    bool? isActive,
  }) {
    return TabState(
      index: index ?? this.index,
      isActive: isActive ?? this.isActive,
    );
  }
}
