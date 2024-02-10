import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/order/data_sources/order_data_source.dart';
import 'package:tezz_cafe/data/order/models/order_model.dart';
import 'package:tezz_cafe/feature/orders/data/data_sources/order_data_source.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByCafeId(String cafeId, String waitressId);
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource = getIt<OrderDataSourceImpl>();

  @override
  Future<Either<Failure, List<OrderModel>>> fetchOrdersByCafeId(String cafeId, String waitressId) async {
    try {
      final orders = await orderDataSource.fetchOrdersByCafeId(cafeId, waitressId);
      return Right(orders);
    } on FormatException catch (e) {
      return Left(ParseFailure(e.message));
    } on SocketException catch (e) {
      return Left(NoInternetFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
