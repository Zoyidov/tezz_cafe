import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/product/data/models/product_model.dart';
import 'package:tezz_cafe/feature/product/domain/repositories/product_repository.dart';

class GetProductByMenuIdUseCase extends UseCase<String, List<ProductModel>> {
  final ProductRepository menuRepository;

  GetProductByMenuIdUseCase(this.menuRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> execute(String params) async {
    return menuRepository.getProductByMenuId(params);
  }
}
