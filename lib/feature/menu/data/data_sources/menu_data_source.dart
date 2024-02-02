import 'package:dio/dio.dart'; // You may need to import Dio or use your preferred HTTP client
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/menu/data/models/menu_model.dart';
import 'package:tezz_cafe/core/error/failures.dart'; // Import your failure classes

abstract class MenuDataSource {
  Future<List<MenuModel>> getMenuItems();
}

class MenuDataSourceImpl implements MenuDataSource {
  final Dio dio; // Assuming you're using Dio for HTTP requests

  MenuDataSourceImpl(this.dio);

  @override
  Future<List<MenuModel>> getMenuItems() async {
    try {
      final response = await dio.get(ApiConstants.menuAll);
      if (response.statusCode == 200) {
        return List<MenuModel>.from(response.data['data'].map((item) => MenuModel.fromJson(item))).toList();
      }
      throw const StatusFailure('Status code not 200');
    } on DioException catch (e) {
      handleDioException(e);
      throw UnknownFailure('Unknown error: ${e.message}');
    } catch (e) {
      // Handle DioException or other errors and convert them to a custom Failure
      throw NetworkFailure('Failed to fetch menu items: $e');
    }
  }
}