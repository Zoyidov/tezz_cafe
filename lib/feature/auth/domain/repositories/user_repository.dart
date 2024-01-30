import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, String>> login({required String username, required String password});
}
