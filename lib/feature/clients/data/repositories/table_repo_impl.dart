// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:tezz_cafe/core/error/failures.dart';
// import 'package:tezz_cafe/feature/clients/domain/repositories/table_repo.dart';
// import 'package:tezz_cafe/feature/clients/data/data_sources/table_data_source.dart';
// import 'package:tezz_cafe/data/table/models/table_model.dart';
//
// class TableRepositoryImpl implements TableRepository {
//   final TableDataSource tableDataSource;
//
//   TableRepositoryImpl(this.tableDataSource);
//
//   @override
//   Future<Either<Failure, List<TableModel>>> getTableByWaitressId(
//   {required String cafeId}) async {
//     try {
//       final response = await tableDataSource.getTableByWaitressId(cafeId: cafeId);
//       return Right(response);
//     } on Failure catch (e) {
//       return Left(e);
//     } on Exception catch (e) {
//       return Left(UnknownFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<TableModel>>> getTablesByCafe({required String cafeId}) async {
//     try {
//       final response = await tableDataSource.getTablesByCafe(cafeId: cafeId);
//       return Right(response);
//     } on Failure catch (e) {
//       return Left(e);
//     } on Exception catch (e) {
//       return Left(UnknownFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> updateTable(
//       {required String tableId, required String waiterToken, required String cafeId}) async {
//     try {
//       final response = await tableDataSource.updateTable(tableId: tableId, waiterToken: waiterToken, cafeId: cafeId);
//       return Right(response);
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 404) {
//         return Left(DioFailure(e.response?.data['message'] ?? 'Dio Xatolik', e.response?.statusCode));
//       }
//       return Left(DioFailure(e.message ?? 'Dio Xatolik', e.response?.statusCode));
//     } on FormatException catch (e) {
//       return Left(ParseFailure("Noto‘g‘ri kiritish:${e.message}"));
//     } on SocketException catch (e) {
//       return const Left(NoInternetFailure('Internet xatolik'));
//     } catch (e) {
//       return Left(UnknownFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> loginCode(
//       {required String tableId, required String waiterToken, required String cafeId,required String code}) async {
//     try {
//       final response = await tableDataSource.loginCode(
//         tableId: tableId,
//         waiterToken: waiterToken,
//         cafeId: cafeId,
//         code: code,
//       );
//       return Right(response);
//     } on DioException catch (e) {
//       print(e.response?.data['message']+"dioError");
//       if (e.response?.statusCode == 400) {
//         return Left(DioFailure(e.response?.data['message'] ?? 'Dio Xatolik', e.response?.statusCode));
//       }
//       return Left(DioFailure(e.message ?? 'Dio Xatolik', e.response?.statusCode));
//     } on FormatException catch (e) {
//       return Left(ParseFailure("Noto‘g‘ri kiritish:${e.message}"));
//     } on SocketException catch (e) {
//       return const Left(NoInternetFailure('Internet xatolik'));
//     } catch (e) {
//       return Left(UnknownFailure(e.toString()));
//     }
//   }
// }
