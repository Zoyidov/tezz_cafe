import 'dart:async';

import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';
import 'package:tezz_cafe/data/table/repositories/table_repository.dart';

part 'table_event.dart';

part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  final TableRepository tableRepository = getIt<TableRepositoryImpl>();

  TableBloc() : super(TableState()) {
    on<GetTablesByCafeEvent>(_fetchTablesByCafeEvent);
  }

  Future<void> _fetchTablesByCafeEvent(GetTablesByCafeEvent event, Emitter<TableState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final result = await tableRepository.getTablesByCafeId(event.cafeId);
    result.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, message: failure.message)),
      (tables) => emit(state.copyWith(status: FormzSubmissionStatus.success, table: tables)),
    );
  }
}
