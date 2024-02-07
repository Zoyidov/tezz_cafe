import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/orders/data/data_sources/order_data_source.dart';
import 'package:tezz_cafe/feature/orders/data/models/order_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderModel>>> getOrders(String token);
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource;

  OrderRepositoryImpl(this.orderDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(String token) async {
    try {
      final orders = await orderDataSource.getOrders(token);
      return Right(orders);
    } on DioException catch (e) {
      return Left(DioFailure(e.message ?? 'Dio Xatolik', e.response?.statusCode));
    } on FormatException catch (e) {
      return Left(ParseFailure("Noto‘g‘ri kiritish:${e.message}"));
    } on SocketException catch (e) {
      return Left(NoInternetFailure('Internet xatolik'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
