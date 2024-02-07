import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/menu/data/models/menu_model.dart';
import 'package:tezz_cafe/feature/menu/domain/repositories/menu_repository.dart';

// class KafeIdParams {
//   final String kafeId;
//
//   KafeIdParams(this.kafeId);
// }

class NoParams {}

class GetMenuItemsUseCase implements UseCase<String, List<MenuModel>> {
  final MenuRepository menuRepository;

  GetMenuItemsUseCase(this.menuRepository);

  @override
  Future<Either<Failure, List<MenuModel>>> execute(String cafeId) async {
    return await menuRepository.getMenuItems(cafeId);
  }
}
