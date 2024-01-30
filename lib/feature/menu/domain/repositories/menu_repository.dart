import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/menu/data/models/menu_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuModel>>> getMenuItems();
}

