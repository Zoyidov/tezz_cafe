import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';

abstract class TableDataSource {
  Future<List<TableModel>> fetchTablesByCafeId(String cafeId);
}

class TableDataSourceImpl extends TableDataSource {
  final Dio _dio = getIt<DioSettings>().dio;

  @override
  Future<List<TableModel>> fetchTablesByCafeId(String cafeId) async {
    try {
      final response = await _dio.get(ApiConstants.tables, queryParameters: {'cafe_id': cafeId});
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => TableModel.fromJson(e)).toList();
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
