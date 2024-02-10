// import 'package:dartz/dartz.dart';
// import 'package:tezz_cafe/core/error/failures.dart';
// import 'package:tezz_cafe/core/usecases/usecase.dart';
// import 'package:tezz_cafe/data/table/models/table_model.dart';
// import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';
//
// class TableWaitressParams {
//   final String cafeId;
//
//   const TableWaitressParams({
//     required this.cafeId,
//   });
// }
//
// class GetTableByWaitressIdUseCase extends UseCase<TableWaitressParams, List<TableModel>> {
//   final TableRepository tableRepository;
//
//   GetTableByWaitressIdUseCase(this.tableRepository);
//
//   @override
//   Future<Either<Failure, List<TableModel>>> execute(TableWaitressParams params) {
//     return tableRepository.getTableByWaitressId(cafeId: params.cafeId);
//   }
// }
