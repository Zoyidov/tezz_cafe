import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/waitress/data/models/waitress_model.dart';
import 'package:tezz_cafe/feature/waitress/domain/repositories/waitress_repo.dart';

class GetWaitressByToken extends UseCase<String, WaitressModel> {
  final WaitressRepository _waitressRepository;

  GetWaitressByToken(this._waitressRepository);

  @override
  Future<Either<Failure, WaitressModel>> execute(String params) {
    return _waitressRepository.getWaitress(params);
  }
}
