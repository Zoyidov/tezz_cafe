import 'package:dio/dio.dart'; // You may need to import Dio or use your preferred HTTP client
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/menu/models/menu_model.dart';

abstract class MenuDataSource {
  Future<List<MenuModel>> getMenuItems(String cafeId);
}

class MenuDataSourceImpl implements MenuDataSource {
  final Dio dio = getIt<DioSettings>().dio; // Assuming you're using Dio for HTTP requests

  MenuDataSourceImpl();

  @override
  Future<List<MenuModel>> getMenuItems(String cafeId) async {
    try {
      final response = await dio.get(ApiConstants.menuAll, queryParameters: {'cafe_id': cafeId});
      if (response.statusCode == 200) {
        return List<MenuModel>.from(response.data.map((item) => MenuModel.fromJson(item))).toList();
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
