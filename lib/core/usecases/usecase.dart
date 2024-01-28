import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';

// Abstract UseCase class
abstract class UseCase<Params, Result> {
  Future<Either<Failure, Result>> execute(Params params);
}
