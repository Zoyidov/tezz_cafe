import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/usecases/usecase.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';
import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';

class TableWaitressParams {
  final String cafeId;
  final String waiterId;

  const TableWaitressParams({
    required this.cafeId,
    required this.waiterId,
  });
}

class GetTableByWaitressIdUseCase extends UseCase<TableWaitressParams, List<TableModel>> {
  final TableRepository tableRepository;

  GetTableByWaitressIdUseCase(this.tableRepository);

  @override
  Future<Either<Failure, List<TableModel>>> execute(TableWaitressParams params) {
    return tableRepository.getTableByWaitressId(waiterId: params.waiterId, cafeId: params.cafeId);
  }
}
