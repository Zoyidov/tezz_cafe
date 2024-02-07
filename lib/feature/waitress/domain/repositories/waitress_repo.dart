import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/waitress/data/models/waitress_model.dart';

abstract class WaitressRepository {
  Future<Either<Failure, WaitressModel>> getWaitress(String token);
}
