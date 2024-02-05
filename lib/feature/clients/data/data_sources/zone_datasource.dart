import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';
import 'package:tezz_cafe/core/utils/di/dio_settings.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/clients/data/models/zone_model.dart';

abstract class ZoneDataSource {
  Future<List<ZoneModel>> getZones(String cafeId);
}

class ZoneDataSourceImpl implements ZoneDataSource {
  final DioSettings dioSettings;

  ZoneDataSourceImpl({required this.dioSettings});

  @override
  Future<List<ZoneModel>> getZones(String cafeId) async {
    try {
      final response = await dioSettings.dio.get("${ApiConstants.zoneAll}/$cafeId");
      if (response.statusCode == 200) {
        return List<ZoneModel>.from(response.data["data"].map((x) => ZoneModel.fromJson(x)));
      }
      throw ServerFailure("Xatolik yuz berdi. Status code: ${response.statusCode}");
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
