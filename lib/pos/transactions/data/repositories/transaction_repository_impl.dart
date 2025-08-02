import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/transaction_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionApi _api;

  TransactionRepositoryImpl({required TransactionApi api}) : _api = api;

  @override
  Future<Either<Failure, PaginatedList<Transaction>>> getBranchTransactions({
    required int page,
    required int size,
    String? search,
  }) async {
    try {
      final responseDto = await _api.getTransactions(
        page: page,
        size: size,
        search: search,
      );

      return Right(responseDto.convert((item) => item.toDomain()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(int id) async {
    try {
      final response = await _api.getTransactionById(id);
      return Right(response.toDomain());
      // } on DioException catch (e) {
      //   return Left(ServerFailure(e.message!));
      // }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedList<Transaction>>> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    String? search,
    int? shift,
    int? branch,
    bool? isAllBranches,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final responseDto = await _api.getTransactions(
        type: type,
        page: page,
        size: size,
        shift: shift,
        search: search,
        branch: branch,
        isAllBranches: isAllBranches,
        startDate: startDate,
        endDate: endDate,
      );

      return Right(responseDto.convert((item) => item.toDomain()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
