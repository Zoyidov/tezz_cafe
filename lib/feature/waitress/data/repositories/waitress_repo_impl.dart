import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/waitress/data/data_sources/waitress_data_source.dart';
import 'package:tezz_cafe/feature/waitress/data/models/waitress_model.dart';
import 'package:tezz_cafe/feature/waitress/domain/repositories/waitress_repo.dart';

class WaitressRepositoryImpl implements WaitressRepository {
  final WaitressDataSource _waitressDataSource;

  WaitressRepositoryImpl(this._waitressDataSource);

  @override
  Future<Either<Failure, WaitressModel>> getWaitress(String token) async {
    try {
      final response = await _waitressDataSource.getWaitress(token);
      return Right(response);
    } on StatusFailure {
      return const Left(StatusFailure("Tarmoq xatoligi status code:"));
    } on ParseFailure catch (e) {
      return Left(ParseFailure('O`girishdagi xatolik: ${e.message}'));
    } on NetworkFailure {
      return const Left(NetworkFailure('Tarmoqda Internet mavjud emas'));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}