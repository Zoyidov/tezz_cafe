import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/product/data_sources/product_data_source.dart';
import 'package:tezz_cafe/data/product/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProductByMenuId(String menuId);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource = getIt<ProductDataSourceImpl>();

  @override
  Future<Either<Failure, List<ProductModel>>> getProductByMenuId(String menuId) async {
    try {
      final response = await dataSource.getProductByMenuId(menuId);
      return Right(response);
    } on FormatException catch (e) {
      return Left(ParseFailure(e.toString()));
    } on SocketException catch (e) {
      return Left(NoInternetFailure(e.toString()));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
