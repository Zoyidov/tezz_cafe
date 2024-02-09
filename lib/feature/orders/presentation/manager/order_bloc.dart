import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';
import 'package:tezz_cafe/feature/orders/data/models/order_model.dart';
import 'package:tezz_cafe/feature/orders/data/repositories/oreder_repository.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc(this.orderRepository) : super(const OrderState()) {
    on<GetOrdersEvent>(_getOrders);
  }

  FutureOr<void> _getOrders(GetOrdersEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    print(state.status);
    final orders = await orderRepository.getOrders(event.token);

    orders.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, message: failure.message)),
      (orders) => emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          orders: orders,
          filteredOrders: orders.where((element) => element.stolId == event.table.id).toList())),
    );
  }
}
