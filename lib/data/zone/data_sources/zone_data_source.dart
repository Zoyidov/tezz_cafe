import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/zone/models/zone_model.dart';

abstract class ZoneDataSource {
  Future<List<ZoneModel>> getZonesByCafeId(String cafeId);
}

class ZoneDataSourceImpl implements ZoneDataSource {
  final Dio _dio = getIt<DioSettings>().dio;

  @override
  Future<List<ZoneModel>> getZonesByCafeId(String cafeId) async {
    try {
      final response = await _dio.get(ApiConstants.zones, queryParameters: {"cafe_id": cafeId});
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => ZoneModel.fromJson(e)).toList();
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
