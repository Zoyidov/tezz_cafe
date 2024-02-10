import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/zone/models/zone_model.dart';
import 'package:tezz_cafe/data/zone/repositories/zone_repository.dart';

part 'zone_event.dart';

part 'zone_state.dart';

class ZoneBloc extends Bloc<ZoneEvent, ZoneState> {
  final ZoneRepository zoneRepository = getIt<ZoneRepositoryImpl>();
final PageController activePageController = PageController();
final PageController noActivePageController = PageController();
  ZoneBloc() : super(const ZoneState()) {
    on<FetchZoneByCafeIdEvent>(_fetchZoneByCafeIdEvent);
    on<SelectActiveZoneEvent>(_selectActiveZone);
    on<SelectNoActiveZoneEvent>(_selectNoActiveZone);
  }

  Future<void> _fetchZoneByCafeIdEvent(FetchZoneByCafeIdEvent event, Emitter<ZoneState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final failureOrZone = await zoneRepository.getZonesByCafeId(event.cafeId);
    failureOrZone.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, message: failure.message)),
      (zone) {
        final activeZone = List<bool>.generate(zone.length, (index) => false);
        activeZone[0] = true;
        emit(state.copyWith(
            status: FormzSubmissionStatus.success, zone: zone, activeZone: activeZone, noActiveZone: activeZone));
      },
    );
  }

  void _selectActiveZone(SelectActiveZoneEvent event, Emitter<ZoneState> emit) {
    final activeZone = List<bool>.generate(state.zone.length, (index) => event.index == index ? true : false);
    emit(state.copyWith(activeZone: activeZone));
    activePageController.animateToPage(event.index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _selectNoActiveZone(SelectNoActiveZoneEvent event, Emitter<ZoneState> emit) {
    final noActiveZone = List<bool>.generate(state.zone.length, (index) => event.index == index ? true : false);
    emit(state.copyWith(noActiveZone: noActiveZone));
    noActivePageController.animateToPage(event.index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
