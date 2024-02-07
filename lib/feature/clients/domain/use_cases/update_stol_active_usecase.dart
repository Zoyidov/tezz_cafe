import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';

class UpdateTableActiveParams {
  final String tableId;
  final String waiterToken;
  final String cafeId;

  const UpdateTableActiveParams({required this.tableId, required this.waiterToken, required this.cafeId});
}

class UpdateTableActiveUseCase extends UseCase<UpdateTableActiveParams, void> {
  final TableRepository tableRepository;

  UpdateTableActiveUseCase(this.tableRepository);

  @override
  Future<Either<Failure, void>> execute(UpdateTableActiveParams params) async {
    return tableRepository.updateTable(tableId: params.tableId, waiterToken: params.waiterToken, cafeId: params.cafeId);
  }
}
