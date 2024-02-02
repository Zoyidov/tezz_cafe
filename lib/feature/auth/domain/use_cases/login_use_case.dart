import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/auth/domain/repositories/user_repository.dart';

// Parameters class for login use case
class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
}

// Login use case
class LoginUseCase implements UseCase<LoginParams, String> {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  @override
  Future<Either<Failure, String>> execute(LoginParams params) async {
    return await userRepository.login(username: params.username, password: params.password);
  }
}
