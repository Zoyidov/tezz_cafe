import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure,List<ProductModel>>> getProductByMenuId(String menuId);
}
