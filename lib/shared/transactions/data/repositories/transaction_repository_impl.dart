import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/api/transaction_api.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionApi _transactionApi;

  TransactionRepositoryImpl(this._transactionApi);

  @override
  Future<Either<Failure, Transaction>> getTransactionById(int id) async {
    try {
      final response = await _transactionApi.getTransactionById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, TransactionPaginatedList>> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    int? register,
    int? branch,
  }) async {
    try {
      final response = await _transactionApi.getTransactions(
        type: type,
        page: page,
        size: size,
        register: register,
        branch: branch,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
