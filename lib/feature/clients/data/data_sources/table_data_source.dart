import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';

abstract class TableDataSource {

  Future<List<TableModel>> getTableByWaitressId({required String cafeId});

  Future<List<TableModel>> getTablesByCafe({required String cafeId});

  Future<void> updateTable({required String tableId, required String waiterToken, required String cafeId});

  Future<String> loginCode(
      {required String tableId, required String waiterToken, required String cafeId, required String code});
}

class TableDataSourceImpl implements TableDataSource {
  final dio = getIt<DioSettings>().dio;

  @override
  Future<List<TableModel>> getTableByWaitressId({required String cafeId}) async {
    try {
      final response = await dio.get("tables/",queryParameters:{"cafe_id": cafeId});
      if (response.statusCode == 200) {
        return List<TableModel>.from(response.data.map((x) => TableModel.fromJson(x)));
      }
      throw StatusFailure('Status code not 200 ${response.statusCode}');
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

  @override
  Future<List<TableModel>> getTablesByCafe({required String cafeId}) async {
    try {
      final response = await dio.get("stol/all/$cafeId");
      if (response.statusCode == 200) {
        return List<TableModel>.from(response.data['data'].map((x) => TableModel.fromJson(x)));
      }
      throw const StatusFailure('Status code not 200');
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

  @override
  Future<void> updateTable({required String tableId, required String waiterToken, required String cafeId}) async {
    try {
      // stol/update/65c2f8827ce4b3f89d31a0a8/activate/65c2f9357ce4b3f89d31a0c2
      final response = await dio.put('stol/update/$cafeId/activate/$tableId',
          options: Options(headers: {"Authorization": waiterToken}));
      if (response.statusCode == 200) {
        return;
      }
      throw 'Status kode 200 ga teng emas ${response.statusCode}';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> loginCode(
      {required String tableId, required String waiterToken, required String cafeId, required String code}) async {
    try {
      // stol/login/65c2f8827ce4b3f89d31a0a8/65c2f9357ce4b3f89d31a0c2
      print('stol/login/$cafeId/$tableId');
      print(cafeId);
      print(tableId);
      print(code);
      print(waiterToken);
      Logger().e(code);
      final response = await dio.post(
        'stol/login/$cafeId/$tableId',
        options: Options(headers: {"Authorization": waiterToken}),
        data: {"code":code}
      );
      Logger().e(response.data);
      if (response.statusCode == 200) {
        return response.data['token'];
      } else if (response.statusCode == 400) {
        throw response.data['message'];
      }
      throw 'Status kode 200 ga teng emas ${response.statusCode}';
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw e.response?.data['message'] ?? 'Dio Xatolik';
      } else {
        throw e.message ?? 'Dio Xatolik';
      }
    } catch (e) {
      rethrow;
    }
  }
}
