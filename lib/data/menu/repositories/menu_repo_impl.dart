import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/menu/data_sources/menu_data_source.dart';
import 'package:tezz_cafe/data/menu/models/menu_model.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuModel>>> getMenuItems(String cafeId);
}

class MenuRepositoryImpl implements MenuRepository {
  final MenuDataSource menuDataSource = getIt<MenuDataSourceImpl>();

  @override
  Future<Either<Failure, List<MenuModel>>> getMenuItems(String cafeId) async {
    try {
      final menuItems = await menuDataSource.getMenuItems(cafeId);
      return Right(menuItems);
    } on FormatException catch (e) {
      return Left(ParseFailure(e.message));
    } on SocketException catch (e) {
      return const Left(NoInternetFailure('Internet xatolik'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
