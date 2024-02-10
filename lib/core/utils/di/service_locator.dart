// lib/di/service_locator.dart

import 'package:get_it/get_it.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/data/menu/data_sources/menu_data_source.dart';
import 'package:tezz_cafe/data/menu/repositories/menu_repo_impl.dart';
import 'package:tezz_cafe/data/order/data_sources/order_data_source.dart';
import 'package:tezz_cafe/data/order/repositories/order_repository.dart';
import 'package:tezz_cafe/data/order_item/data_sources/order_item_data_source.dart';
import 'package:tezz_cafe/data/order_item/repositories/order_item_repository.dart';
import 'package:tezz_cafe/data/product/data_sources/product_data_source.dart';
import 'package:tezz_cafe/data/product/repositories/product_repository_impl.dart';
import 'package:tezz_cafe/data/table/data_sources/table_data_source.dart';
import 'package:tezz_cafe/data/table/repositories/table_repository.dart';
import 'package:tezz_cafe/data/zone/data_sources/zone_data_source.dart';
import 'package:tezz_cafe/data/zone/repositories/zone_repository.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/auth/data/repositories/user_repository_impl.dart';
import 'package:tezz_cafe/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:tezz_cafe/feature/waitress/data/data_sources/waitress_data_source.dart';
import 'package:tezz_cafe/feature/waitress/data/repositories/waitress_repo_impl.dart';
import 'package:tezz_cafe/feature/waitress/domain/use_cases/get_waitress_by_token.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register your dependencies here
  getIt.registerSingleton(StorageRepository.getInstance());
  getIt.registerSingleton(DioSettings());
  // Register your data sources here
  getIt.registerSingleton(TableDataSourceImpl());
  getIt.registerSingleton(MenuDataSourceImpl());
  getIt.registerSingleton(UserDataSourceImpl());
  getIt.registerSingleton(ProductDataSourceImpl());
  getIt.registerSingleton(OrderItemDataSourceImpl());
  getIt.registerSingleton(ZoneDataSourceImpl());
  getIt.registerSingleton(WaitressDataSourceImpl());
  getIt.registerSingleton(OrderDataSourceImpl());
  // Register your repositories here
  getIt.registerSingleton(MenuRepositoryImpl());
  getIt.registerSingleton(UserRepositoryImpl(getIt.get<UserDataSourceImpl>()));
  getIt.registerSingleton(ProductRepositoryImpl());
  getIt.registerSingleton(ZoneRepositoryImpl());
  getIt.registerSingleton(OrderItemRepositoryImpl());
  getIt.registerSingleton(TableRepositoryImpl());
  getIt.registerSingleton(OrderRepositoryImpl());
  getIt.registerSingleton(WaitressRepositoryImpl(getIt<WaitressDataSourceImpl>()));
  // Register your use cases here
  // getIt.registerSingleton(GetMenuItemsUseCase(getIt<MenuRepositoryImpl>()));
  getIt.registerSingleton(LoginUseCase(getIt.get<UserRepositoryImpl>()));
  // getIt.registerSingleton(GetZonesUseCase(getIt.get<ZoneRepositoryImpl>()));
  // getIt.registerSingleton(GetProductByMenuIdUseCase(getIt<ProductRepositoryImpl>()));
  // getIt.registerSingleton(GetTableByWaitressIdUseCase(getIt<TableRepositoryImpl>() as TableRepository));
  // getIt.registerSingleton(GetTablesByCafeUseCase(getIt<TableRepositoryImpl>()));
  getIt.registerSingleton(GetWaitressByToken(getIt<WaitressRepositoryImpl>()));
  // getIt.registerSingleton(LoginCodeUseCase(getIt<TableRepositoryImpl>()));
  // getIt.registerSingleton(UpdateTableActiveUseCase(getIt<TableRepositoryImpl>()));
}

void tearDownLocator() {
  getIt.reset();
}
