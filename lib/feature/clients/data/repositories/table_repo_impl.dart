import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';
import 'package:tezz_cafe/feature/clients/data/data_sources/table_data_source.dart';
import 'package:tezz_cafe/feature/clients/data/models/table_model.dart';

class TableRepositoryImpl implements TableRepository {
  final TableDataSource tableDataSource;

  TableRepositoryImpl(this.tableDataSource);

  @override
  Future<Either<Failure, List<TableModel>>> getTableByWaitressId(
      {required String waiterId, required String cafeId}) async {
    try {
      final response = await tableDataSource.getTableByWaitressId(waiterId: waiterId, cafeId: cafeId);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
