import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/waitress/data/models/waitress_model.dart';

abstract class WaitressDataSource {
  Future<WaitressModel> getWaitress(String token);
}

class WaitressDataSourceImpl implements WaitressDataSource {
  Dio dio = getIt<DioSettings>().dio;

  @override
  Future<WaitressModel> getWaitress(String token) async {
    try {
      final response =
          await dio.get(ApiConstants.waiterOne, options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        return WaitressModel.fromJson(response.data["data"]);
      }
      if (response.statusCode == 401) {
print('401');


      }
      throw StatusFailure('Xatolik yuz berdi: Status code: ${response.statusCode}');
    } on DioException catch (e) {
      print('dio');

      handleDioException(e);
      throw UnknownFailure('Unknown error: ${e.message}');
    } on SocketException {
      throw const NetworkFailure('No internet connection');
    } on FormatException catch (e) {
      throw ParseFailure(e.message);
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
