import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/clients/data/models/zone_model.dart';

abstract class ZoneRepository {
  Future<Either<Failure, List<ZoneModel>>> getZones(String cafeId);
}
