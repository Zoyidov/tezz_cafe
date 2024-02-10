import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/order_item/models/order_item_model.dart';

abstract class OrderItemDataSource {
  Future<List<OrderItemModel>> getOrderItems(String orderId);
}

class OrderItemDataSourceImpl implements OrderItemDataSource {
  Dio dio = getIt<DioSettings>().dio;

  @override
  Future<List<OrderItemModel>> getOrderItems(String orderId) async {
    try {
      final response = await dio.get(ApiConstants.orderItems, queryParameters: {"order_id": orderId});
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => OrderItemModel.fromJson(e)).toList();
      }
      if (response.statusCode == 400 || response.statusCode == 404) {
        throw response.data['message'];
      }

      throw "Xatolik yuz berdi:Status: ${response.statusCode}, ${response.data}";
    } catch (e) {
      rethrow;
    }
  }
}
