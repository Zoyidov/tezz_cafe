// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:tezz_cafe/core/error/failures.dart';
// import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
// import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
// import 'package:tezz_cafe/core/utils/di/service_locator.dart';
// import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
// import 'package:tezz_cafe/data/zone/models/zone_model.dart';
//
// abstract class ZoneDataSource {
//   Future<List<ZoneModel>> getZones(String cafeId);
// }
//
// class ZoneDataSourceImpl implements ZoneDataSource {
//   final Dio  dio = getIt<DioSettings>().dio;
//
//   ZoneDataSourceImpl();
//
//   @override
//   Future<List<ZoneModel>> getZones(String cafeId) async {
//     try {
//       final response = await dio.get(ApiConstants.zoneAll,queryParameters: {"cafe_id": cafeId});
//       if (response.statusCode == 200) {
//         return List<ZoneModel>.from(response.data.map((x) => ZoneModel.fromJson(x)));
//       }
//       throw StatusFailure("Xatolik yuz berdi. Status code: ${response.statusCode}");
//     } on DioException catch (e) {
//       handleDioException(e);
//       throw UnknownFailure('Unknown error: ${e.message}');
//     } on SocketException {
//       throw const NetworkFailure('No internet connection');
//     } on FormatException catch (e) {
//       throw ParseFailure(e.message);
//     } catch (e) {
//       throw UnknownFailure(e.toString());
//     }
//   }
// }
