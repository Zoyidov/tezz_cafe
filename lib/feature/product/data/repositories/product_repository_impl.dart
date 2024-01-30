import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/product/data/data_sources/product_data_source.dart';
import 'package:tezz_cafe/feature/product/data/models/product_model.dart';
import 'package:tezz_cafe/feature/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductByMenuId(String menuId) async {
    try {
      final response = await dataSource.getProductByMenuId(menuId);
      return Right(response);
    } catch (e) {
      return Left(e as Failure);
    }
  }
}
