part of 'menu_bloc.dart';

class MenuState {
  final bool isVisible;
  final FormzSubmissionStatus status;
  final List<MenuModel> menuItems;
  final String message;

  const MenuState({
    this.isVisible = true,
    this.status = FormzSubmissionStatus.initial,
    this.menuItems = const [],
    this.message = '',
  });

  MenuState copyWith({
    bool? isVisible,
    FormzSubmissionStatus? status,
    List<MenuModel>? menuItems,
    String? error,
  }) {
    return MenuState(
      isVisible: isVisible ?? this.isVisible,
      status: status ?? this.status,
      menuItems: menuItems ?? this.menuItems,
      message: error ?? this.message,
    );
  }
}
