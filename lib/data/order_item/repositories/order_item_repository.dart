import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/order_item/data_sources/order_item_data_source.dart';
import 'package:tezz_cafe/data/order_item/models/order_item_model.dart';

abstract class OrderItemRepository {
  Future<Either<Failure, List<OrderItemModel>>> getOrderItems(String orderId);
}

class OrderItemRepositoryImpl implements OrderItemRepository {
  final OrderItemDataSource orderItemDataSource = getIt<OrderItemDataSourceImpl>();

  @override
  Future<Either<Failure, List<OrderItemModel>>> getOrderItems(String orderId) async {
    try {
      final orderItems = await orderItemDataSource.getOrderItems(orderId);
      return Right(orderItems);
    } on FormatException catch (e) {
      return Left(ParseFailure("Noto‘g‘ri kiritish:${e.message}"));
    } on SocketException catch (e) {
      return const Left(NoInternetFailure('Internet xatolik'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
