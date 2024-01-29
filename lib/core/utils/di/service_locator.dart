// lib/di/service_locator.dart

import 'package:get_it/get_it.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register your dependencies here
  getIt.registerSingleton(StorageRepository.getInstance());
}

void tearDownLocator() {
  getIt.reset();
}
