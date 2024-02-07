import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/feature/orders/data/models/order_model.dart';

abstract class OrderDataSource {
  Future<List<OrderModel>> getOrders(String token);
}

class OrderDataSourceImpl implements OrderDataSource {
  Dio dio = getIt<DioSettings>().dio;

  @override
  Future<List<OrderModel>> getOrders(String token) async {
    try {
      final response = await dio.get(ApiConstants.orders, options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        return (response.data['data'] as List).map((e) => OrderModel.fromJson(e)).toList();
      }
      throw "Xatolik yuz berdi:Status: ${response.statusCode}";
    } catch (e) {
      rethrow;
    }
  }
}
