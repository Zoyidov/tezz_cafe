import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';
import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';

class GetTablesByCafeUseCase extends UseCase<String, List<TableModel>> {
  final TableRepository tableRepository;

  GetTablesByCafeUseCase(this.tableRepository);

  @override
  Future<Either<Failure, List<TableModel>>> execute(String params) {
    return tableRepository.getTablesByCafe(cafeId: params);
  }
}
