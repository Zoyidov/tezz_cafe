part of 'menu_bloc.dart';

class MenuState {
  final bool isVisible;

  const MenuState({
    this.isVisible = true,
  });

  MenuState copyWith({
    bool? isVisible,
  }) {
    return MenuState(
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
