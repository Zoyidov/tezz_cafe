// import 'package:dartz/dartz.dart';
// import 'package:tezz_cafe/core/error/failures.dart';
// import 'package:tezz_cafe/core/usecases/usecase.dart';
// import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';
// import 'package:tezz_cafe/feature/clients/domain/use_cases/get_table_by_waitress_id_usecase.dart';
//
// import 'update_stol_active_usecase.dart';
//
// class LoginCodeUseCase extends UseCase<UpdateTableActiveParams, String> {
//   final TableRepository tableRepository;
//
//   LoginCodeUseCase(this.tableRepository);
//
//   @override
//   Future<Either<Failure, String>> execute(UpdateTableActiveParams params) {
//     return tableRepository.loginCode(
//         tableId: params.tableId, waiterToken: params.waiterToken, cafeId: params.cafeId, code: params.code ?? "");
//   }
// }
