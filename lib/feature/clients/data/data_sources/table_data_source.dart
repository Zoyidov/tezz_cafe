import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';

abstract class TableDataSource {
  Future<List<TableModel>> getTableByWaitressId({required String waiterId, required String cafeId});

  Future<List<TableModel>> getTablesByCafe({required String cafeId});

  Future<void> updateTable({required String tableId, required String waiterToken, required String cafeId});

  Future<String> loginCode({required String tableId, required String waiterToken, required String cafeId});
}

class TableDataSourceImpl implements TableDataSource {
  final dio = getIt<DioSettings>().dio;

  @override
  Future<List<TableModel>> getTableByWaitressId({required String waiterId, required String cafeId}) async {
    try {
      final response = await dio.get("stol/$cafeId/ofisiant/$waiterId");
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
  Future<String> loginCode({required String tableId, required String waiterToken, required String cafeId}) async {
    try {
      // stol/login/65c2f8827ce4b3f89d31a0a8/65c2f9357ce4b3f89d31a0c2
      final response =
          await dio.get('stol/login/$cafeId/$tableId', options: Options(headers: {"Authorization": waiterToken}));
      if (response.statusCode == 200) {
        return response.data['data'];
      }
      throw 'Status kode 200 ga teng emas ${response.statusCode}';
    } catch (e) {
      rethrow;
    }
  }
}
