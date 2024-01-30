// lib/di/service_locator.dart

import 'package:get_it/get_it.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/auth/data/repositories/user_repository_impl.dart';
import 'package:tezz_cafe/feature/auth/domain/repositories/user_repository.dart';
import 'package:tezz_cafe/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:tezz_cafe/feature/menu/data/data_sources/menu_data_source.dart';
import 'package:tezz_cafe/feature/menu/data/repositories/menu_repo_impl.dart';
import 'package:tezz_cafe/feature/menu/domain/repositories/menu_repository.dart';
import 'package:tezz_cafe/feature/menu/domain/use_cases/get_menu_items_use_case.dart';
import 'package:tezz_cafe/feature/product/data/data_sources/product_data_source.dart';
import 'package:tezz_cafe/feature/product/data/repositories/product_repository_impl.dart';
import 'package:tezz_cafe/feature/product/domain/repositories/product_repository.dart';
import 'package:tezz_cafe/feature/product/domain/use_cases/get_product_by_menu_id_usecase.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register your dependencies here
  getIt.registerSingleton(StorageRepository.getInstance());
  getIt.registerSingleton<DioSettings>(DioSettings());
  // Register your data sources here
  getIt.registerSingleton<MenuDataSourceImpl>(MenuDataSourceImpl(getIt<DioSettings>().dio));
  getIt.registerSingleton<UserDataSourceImpl>(UserDataSourceImpl());
getIt.registerSingleton<ProductDataSourceImpl>(ProductDataSourceImpl());
  // Register your repositories here
  getIt.registerSingleton<MenuRepositoryImpl>(MenuRepositoryImpl(getIt<MenuDataSourceImpl>()));
  getIt.registerSingleton<UserRepositoryImpl>(UserRepositoryImpl(getIt.get<UserDataSourceImpl>()));
  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(getIt<ProductDataSourceImpl>()));
  // Register your use cases here
  getIt.registerSingleton<GetMenuItemsUseCase>(GetMenuItemsUseCase(getIt<MenuRepositoryImpl>()));
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt.get<UserRepositoryImpl>()));
  getIt.registerSingleton<GetProductByMenuIdUseCase>(GetProductByMenuIdUseCase(getIt<ProductRepository>()));

}

void tearDownLocator() {
  getIt.reset();
}
