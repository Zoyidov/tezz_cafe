part of 'client_tab_bloc.dart';

class ClientTabState {
  final int clientTabIndex;
  final int noActiveClientTabIndex;
  final List<bool> isSelected;
  final List<bool> isSelectedNoActive;
  final String failure;
  final List<ZoneModel> zones;
  final List<TableModel> tables;
  final FormzSubmissionStatus zoneStatus;
  final FormzSubmissionStatus updateStatus;

  final FormzSubmissionStatus tableStatus;

  const ClientTabState({
    this.tableStatus = FormzSubmissionStatus.initial,
    this.zoneStatus = FormzSubmissionStatus.initial,
    this.updateStatus = FormzSubmissionStatus.initial,
    this.clientTabIndex = 0,
    this.noActiveClientTabIndex = 0,
    this.isSelected = const [],
    this.isSelectedNoActive = const [],
    this.failure = '',
    this.zones = const [],
    this.tables = const [],
  });

  ClientTabState copyWith({
    int? clientTabIndex,
    int? noActiveClientTabIndex,
    List<bool>? isSelected,
    List<bool>? isSelectedNoActive,
    String? failure,
    List<ZoneModel>? zones,
    List<TableModel>? tables,
    FormzSubmissionStatus? zoneStatus,
    FormzSubmissionStatus? updateStatus,
    FormzSubmissionStatus? tableStatus,
  }) {
    return ClientTabState(
      clientTabIndex: clientTabIndex ?? this.clientTabIndex,
      noActiveClientTabIndex: noActiveClientTabIndex ?? this.noActiveClientTabIndex,
      isSelected: isSelected ?? this.isSelected,
      isSelectedNoActive: isSelectedNoActive ?? this.isSelectedNoActive,
      failure: failure ?? this.failure,
      zones: zones ?? this.zones,
      tables: tables ?? this.tables,
      zoneStatus: zoneStatus ?? this.zoneStatus,
      updateStatus: updateStatus ?? this.updateStatus,
      tableStatus: tableStatus ?? this.tableStatus,
    );
  }
}
