import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/product/data/models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductByMenuId(String menuId);
}

class ProductDataSourceImpl implements ProductDataSource {
  final dio = getIt<DioSettings>();

  @override
  Future<List<ProductModel>> getProductByMenuId(String menuId) async {
    try {
      final response = await dio.dio.get(ApiConstants.productAll,queryParameters: {'menu_id': menuId});
      if (response.statusCode == 200) {
        return List<ProductModel>.from((response.data['data'] as List).map((e) => ProductModel.fromJson(e)));
        // return (response.data as List).map((e) => ProductModel.fromJson(e)).toList();
      }
      throw UnknownFailure(response.data.toString());
    } on DioException catch (e) {
      handleDioException(e);
      throw UnknownFailure(e.toString());
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
