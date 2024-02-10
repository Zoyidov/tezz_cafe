import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/order/models/order_model.dart';
import 'package:tezz_cafe/data/order/repositories/order_repository.dart';
import 'package:tezz_cafe/data/order_item/repositories/order_item_repository.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderItemRepository = getIt<OrderRepositoryImpl>();

  OrderBloc() : super(OrderState()) {
    on<FetchOrdersByCafeIdEvent>(_fetchOrdersByCafeIdEvent);
  }

  Future<void> _fetchOrdersByCafeIdEvent(FetchOrdersByCafeIdEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final failureOrOrderItems =
        await orderItemRepository.fetchOrdersByCafeId(event.cafeId, event.waitressId);
    failureOrOrderItems.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, message: failure.message)),
      (orderItems) => emit(state.copyWith(status: FormzSubmissionStatus.success, orders: orderItems)),
    );
  }
}
