// import 'package:dio/dio.dart';
// import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
// import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
// import 'package:tezz_cafe/core/utils/di/service_locator.dart';
// import 'package:tezz_cafe/data/order/models/order_model.dart';
//
// abstract class OrderDataSource {
//   Future<List<OrderModel>> getOrdersByCafeId(String cafeId,String waitressId);
// }
//
// class OrderDataSourceImpl implements OrderDataSource {
//   Dio dio = getIt<DioSettings>().dio;
//
//   @override
//   Future<List<OrderModel>> getOrdersByCafeId(String cafeId,String waitressId) async {
//     try {
//       final response =
//           await dio.get(ApiConstants.orders,queryParameters: {"cafe_id": cafeId,"waitress_id":waitressId});
//       if (response.statusCode == 200) {
//         return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
//       }
//       if (response.statusCode == 400){
//         throw response.data['message'];
//       }
//       throw "Xatolik yuz berdi:Status: ${response.statusCode}";
//
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
