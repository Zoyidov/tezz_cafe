import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tezz_cafe/core/error/failures.dart';
import 'package:tezz_cafe/core/utils/di/service_locator.dart';
import 'package:tezz_cafe/data/table/data_sources/table_data_source.dart';
import 'package:tezz_cafe/data/table/models/table_model.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableModel>>> getTablesByCafeId(String cafeId);
}

class TableRepositoryImpl implements TableRepository {
  final TableDataSource tableDataSource = getIt<TableDataSourceImpl>();

  @override
  Future<Either<Failure, List<TableModel>>> getTablesByCafeId(String cafeId) async {
    try {
      final response = await tableDataSource.fetchTablesByCafeId(cafeId);
      return Right(response);
    } on FormatException catch (e) {
      return Left(ParseFailure(e.message));
    } on SocketException catch (e) {
      return const Left(NoInternetFailure('Internet xatolik'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
