import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableModel>>> getTableByWaitressId({required String waiterId, required String cafeId});
}
