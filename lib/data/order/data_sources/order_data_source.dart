import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/order/models/order_model.dart';

abstract class OrderDataSource {
  Future<List<OrderModel>> fetchOrdersByCafeId(String cafeId, String waitressId);
}

class OrderDataSourceImpl extends OrderDataSource {
  final _dio = getIt<DioSettings>().dio;

  @override
  Future<List<OrderModel>> fetchOrdersByCafeId(String cafeId, String waitressId) async {
    try {
      final response =
          await _dio.get(ApiConstants.orders, queryParameters: {'cafe_id': cafeId, 'waitress_id': waitressId});
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
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
