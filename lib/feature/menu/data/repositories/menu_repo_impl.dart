import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/menu/data/data_sources/menu_data_source.dart';
import 'package:tezz_cafe/feature/menu/data/models/menu_model.dart';
import 'package:tezz_cafe/feature/menu/domain/repositories/menu_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuDataSource menuDataSource;

  MenuRepositoryImpl(this.menuDataSource);

  @override
  Future<Either<Failure, List<MenuModel>>> getMenuItems(String cafeId) async {
    try {
      final menuItems = await menuDataSource.getMenuItems(cafeId);
      print('here');
      return Right(menuItems);
    } on Failure catch (failure) {
      print('error');
      return Left(failure);
    }
  }
}
