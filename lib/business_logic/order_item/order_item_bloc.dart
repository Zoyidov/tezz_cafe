import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/order_item/models/order_item_model.dart';
import 'package:tezz_cafe/data/order_item/repositories/order_item_repository.dart';

part 'order_item_event.dart';

part 'order_item_state.dart';

class OrderItemBloc extends Bloc<OrderItemEvent, OrderItemState> {
  final OrderItemRepository orderItemRepository = getIt<OrderItemRepositoryImpl>();

  OrderItemBloc() : super(const OrderItemState()) {
    on<FetchOrderItemsEvent>(_fetchOrderItemsEvent);
  }

  Future<void> _fetchOrderItemsEvent(FetchOrderItemsEvent event, Emitter<OrderItemState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final failureOrOrderItems = await orderItemRepository.getOrderItems(event.orderId);
    failureOrOrderItems.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, message: failure.message)),
      (orderItems) => emit(state.copyWith(status: FormzSubmissionStatus.success, orderItems: orderItems)),
    );
  }
}
