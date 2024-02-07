import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';
import 'package:tezz_cafe/feature/clients/data/models/zone_model.dart';
import 'package:tezz_cafe/feature/clients/domain/use_cases/get_table_by_waitress_id_usecase.dart';
import 'package:tezz_cafe/feature/clients/domain/use_cases/get_tables_by_cafe_usecase.dart';
import 'package:tezz_cafe/feature/clients/domain/use_cases/get_zones_usecase.dart';
import 'package:tezz_cafe/feature/clients/domain/use_cases/login_code_usecase.dart';
import 'package:tezz_cafe/feature/clients/domain/use_cases/update_stol_active_usecase.dart';

part 'client_tab_event.dart';

part 'client_tab_state.dart';

class ClientTabBloc extends Bloc<ClientTabEvent, ClientTabState> {
  final GetZonesUseCase getZonesUseCase;
  final GetTablesByCafeUseCase getTablesByCafeUseCase = getIt<GetTablesByCafeUseCase>();
  final GetTableByWaitressIdUseCase getTableByWaitressIdUseCase = getIt<GetTableByWaitressIdUseCase>();
  final UpdateTableActiveUseCase updateTableActiveUseCase = getIt<UpdateTableActiveUseCase>();
  final LoginCodeUseCase loginCodeUseCase = getIt<LoginCodeUseCase>();

  // final List<String> tabs = ['Zall', 'Kabina', 'Terassa'];
  final PageController pageControllerActive = PageController();
  final PageController pageControllerNoActive = PageController();

  ClientTabBloc(this.getZonesUseCase) : super(const ClientTabState()) {
    on<TabChanged>(_tabChanged);
    on<GetTablesByCafe>(_getTablesByCafe);
    on<PageChanged>(_pageChanged);
    on<GetZones>(_getZones);
    on<GetTablesByWaitress>(_getTablesByWaitress);
    on<TabChangedNoActive>(_tabChangedNoActive);
    on<PageChangedNoActive>(_pageChangedNoActive);
    on<UpdateTableActive>(_updateTableActive);
  }

  void _updateTableActive(UpdateTableActive event, Emitter<ClientTabState> emit) async {
    emit(state.copyWith(tableStatus: FormzSubmissionStatus.inProgress));
    final loginCodeResult = await loginCodeUseCase
        .execute(UpdateTableActiveParams(tableId: event.tableId, waiterToken: event.waiterToken, cafeId: event.cafeId));
    if (loginCodeResult.isLeft()) {
      emit(state.copyWith(
        updateStatus: FormzSubmissionStatus.failure,
        failure: loginCodeResult.fold((l) => l.message, (r) => null),
      ));
    } else {
      final result = await updateTableActiveUseCase.execute(
          UpdateTableActiveParams(tableId: event.tableId, waiterToken: event.waiterToken, cafeId: event.cafeId));

      if (result.isLeft()) {
        emit(state.copyWith(
            updateStatus: FormzSubmissionStatus.failure, failure: result.fold((l) => l.message, (r) => null)));
        return;
      }
      emit(state.copyWith(updateStatus: FormzSubmissionStatus.success));
    }

    // result
    //     .fold((failure) => emit(state.copyWith(failure: failure.message, updateStatus: FormzSubmissionStatus.failure)),
    //         (tables) async {
    //   emit(state.copyWith(updateStatus: FormzSubmissionStatus.success));
    // });
  }

  void _getTablesByCafe(GetTablesByCafe event, Emitter<ClientTabState> emit) async {
    emit(state.copyWith(tableStatus: FormzSubmissionStatus.inProgress));
    final result = await getTablesByCafeUseCase.execute(event.cafeId);
    result.fold((failure) => emit(state.copyWith(failure: failure.message, tableStatus: FormzSubmissionStatus.failure)),
        (tables) {
      emit(state.copyWith(tables: tables, tableStatus: FormzSubmissionStatus.success));
    });
  }

  void _getTablesByWaitress(GetTablesByWaitress event, Emitter<ClientTabState> emit) async {
    emit(state.copyWith(tableStatus: FormzSubmissionStatus.inProgress));
    final result =
        await getTableByWaitressIdUseCase.execute(TableWaitressParams(cafeId: event.cafeId, waiterId: event.waiterId));
    result.fold((failure) => emit(state.copyWith(failure: failure.message, tableStatus: FormzSubmissionStatus.failure)),
        (tables) {
      emit(state.copyWith(tables: tables, tableStatus: FormzSubmissionStatus.success));
    });
  }

  void _getZones(GetZones event, Emitter<ClientTabState> emit) async {
    emit(state.copyWith(zoneStatus: FormzSubmissionStatus.inProgress));
    final result = await getZonesUseCase.execute(event.cafeId);
    result.fold((failure) => emit(state.copyWith(failure: failure.message, zoneStatus: FormzSubmissionStatus.failure)),
        (zones) {
      final selectedZones = zones.map((e) {
        if (zones.indexOf(e) == 0) {
          return true;
        }
        return false;
      }).toList();
      emit(state.copyWith(
          zones: zones,
          isSelected: selectedZones,
          isSelectedNoActive: selectedZones,
          zoneStatus: FormzSubmissionStatus.success));
    });
  }

  void _pageChanged(PageChanged event, Emitter<ClientTabState> emit) {
    List<bool> updatedSelection = List.from(state.isSelected);
    for (int i = 0; i < updatedSelection.length; i++) {
      updatedSelection[i] = i == event.index;
    }

    emit(state.copyWith(clientTabIndex: event.index, isSelected: updatedSelection));
  }

  void _pageChangedNoActive(PageChangedNoActive event, Emitter<ClientTabState> emit) {
    List<bool> updatedSelection = List.from(state.isSelectedNoActive);
    for (int i = 0; i < updatedSelection.length; i++) {
      updatedSelection[i] = i == event.index;
    }

    emit(state.copyWith(noActiveClientTabIndex: event.index, isSelectedNoActive: updatedSelection));
  }

  void _tabChanged(TabChanged event, Emitter<ClientTabState> emit) {
    List<bool> updatedSelection = List.from(state.isSelected);
    for (int i = 0; i < updatedSelection.length; i++) {
      updatedSelection[i] = i == event.index;
    }
    emit(state.copyWith(clientTabIndex: event.index, isSelected: updatedSelection));
    pageControllerActive.animateToPage(event.index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _tabChangedNoActive(TabChangedNoActive event, Emitter<ClientTabState> emit) {
    List<bool> updatedSelection = List.from(state.isSelectedNoActive);
    for (int i = 0; i < updatedSelection.length; i++) {
      updatedSelection[i] = i == event.index;
    }
    emit(state.copyWith(noActiveClientTabIndex: event.index, isSelectedNoActive: updatedSelection));
    pageControllerNoActive.animateToPage(event.index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
