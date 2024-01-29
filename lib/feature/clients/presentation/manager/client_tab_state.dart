part of 'client_tab_bloc.dart';

class ClientTabState {
  final int clientTabIndex;
  final List<bool> isSelected;

  const ClientTabState({
    this.clientTabIndex = 0,
    this.isSelected = const [true, false, false],
  });

  ClientTabState copyWith({
    int? clientTabIndex,
    List<bool>? isSelected,
  }) {
    return ClientTabState(
      clientTabIndex: clientTabIndex ?? this.clientTabIndex,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
