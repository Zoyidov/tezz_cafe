import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/zone/data_sources/zone_data_source.dart';
import 'package:tezz_cafe/data/zone/models/zone_model.dart';

abstract class ZoneRepository {
  Future<Either<Failure, List<ZoneModel>>> getZonesByCafeId(String cafeId);
}

class ZoneRepositoryImpl implements ZoneRepository {
  final ZoneDataSource zoneDataSource = getIt<ZoneDataSourceImpl>();

  @override
  Future<Either<Failure, List<ZoneModel>>> getZonesByCafeId(String cafeId) async {
    try {
      final zones = await zoneDataSource.getZonesByCafeId(cafeId);
      return Right(zones);
    } on FormatException catch (e) {
      return Left(ParseFailure("Noto‘g‘ri kiritish:${e.message}"));
    } on SocketException catch (e) {
      return const Left(NoInternetFailure('Internet xatolik'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
