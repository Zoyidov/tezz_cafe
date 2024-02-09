import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableModel>>> getTableByWaitressId({required String waiterId, required String cafeId});

  Future<Either<Failure, List<TableModel>>> getTablesByCafe({required String cafeId});

  Future<Either<Failure, void>> updateTable(
      {required String tableId, required String waiterToken, required String cafeId});

  Future<Either<Failure, String>> loginCode(
      {required String tableId, required String waiterToken, required String cafeId,required String code});
}
