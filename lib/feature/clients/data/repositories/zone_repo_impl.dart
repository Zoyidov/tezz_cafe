// import 'package:dartz/dartz.dart';
// import 'package:tezz_cafe/core/error/failures.dart';
// import 'package:tezz_cafe/feature/clients/data/data_sources/zone_datasource.dart';
// import 'package:tezz_cafe/data/zone/models/zone_model.dart';
// import 'package:tezz_cafe/feature/clients/domain/repositories/zone_repository.dart';
//
// class ZoneRepositoryImpl implements ZoneRepository {
//   final ZoneDataSource zoneDataSource;
//
//   ZoneRepositoryImpl(this.zoneDataSource);
//
//   @override
//   Future<Either<Failure, List<ZoneModel>>> getZones(String cafeId) async {
//     try {
//       final result = await zoneDataSource.getZones(cafeId);
//       return Right(result);
//     } catch (e) {
//       return Left(e as Failure);
//     }
//   }
// }
