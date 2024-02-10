import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/product/models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductByMenuId(String menuId);
}

class ProductDataSourceImpl implements ProductDataSource {
  final _dio = getIt<DioSettings>().dio;

  @override
  Future<List<ProductModel>> getProductByMenuId(String menuId) async {
    try {
      final response = await _dio.get(ApiConstants.productAll, queryParameters: {'menu_id': menuId});
      print(response.data);
      if (response.statusCode == 200) {
        return List<ProductModel>.from((response.data as List).map((e) => ProductModel.fromJson(e)));
      }
      if (response.statusCode == 400 || response.statusCode == 404) {
        throw response.data['message'];
      }
      throw "Something went wrong with status code: ${response.statusCode} ${response.data}";
    } catch (e) {
      rethrow;
    }
  }
}
