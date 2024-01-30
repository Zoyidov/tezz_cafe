import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/auth/data/data_sources/auth_datasource.dart';
import 'package:tezz_cafe/feature/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, String>> login({required String username, required String password}) async {
    try {
      final response = await userDataSource.login(username: username, password: password);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
