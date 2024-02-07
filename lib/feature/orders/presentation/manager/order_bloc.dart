import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
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
    // final token = StorageRepository.getString(StorageKeys.token);
    final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2RlIjoxMjM0LCJzdGF0dXMiOiJzdG9sIiwic3RvbF9pZCI6IjY1YzJjYjAxN2NlNGIzZjg5ZDMxOWY2OCIsImlhdCI6MTcwNzI3MTI0NH0.wCfzkWCGhntEU4nsjkefnguFQeQ3KDHxKuy9_9J9tFw';
    final orders = await orderRepository.getOrders(token);
    print(orders.isRight());
    orders.fold(
      (failure) => emit(state.copyWith(status: FormzSubmissionStatus.failure, message: failure.message)),
      (orders) => emit(state.copyWith(status: FormzSubmissionStatus.success, orders: orders)),
    );
  }
}
