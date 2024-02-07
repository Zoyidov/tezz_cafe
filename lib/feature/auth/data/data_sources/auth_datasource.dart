import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';

abstract class UserDataSource {
  Future<String> login({required String username, required String password});
}

class UserDataSourceImpl implements UserDataSource {
  final dio = getIt<DioSettings>().dio;

  @override
  Future<String> login({required String username, required String password}) async {
    try {
      final response = await dio.post(ApiConstants.login, data: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        return response.data['token'] as String;
      }
      if (response.statusCode == 404) {
        throw const UserNotFoundFailure('Foydalavchi topilmadi');

      }
      throw  StatusFailure('Status code not ${response.statusCode}');
    } on DioException catch (e) {
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

void handleDioException(DioException e) {
  String errorMessage = e.message ?? 'An error occurred';
  String additionalMessage = e.message ?? '';

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      throw NetworkFailure('$errorMessage: No internet connection $additionalMessage');
    case DioExceptionType.badResponse:
      throw ParseFailure('$errorMessage: Incorrect status code $additionalMessage');
    case DioExceptionType.cancel:
      throw NetworkFailure('$errorMessage: Request cancelled $additionalMessage');
    case DioExceptionType.unknown:
      throw UnknownFailure('$errorMessage: $additionalMessage');
    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
      throw NetworkFailure('$errorMessage: $additionalMessage');
    default:
      throw UnknownFailure('$errorMessage: $additionalMessage');
  }
}
