import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/data/api/transaction_api.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';

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
  Future<Either<Failure, TransactionPaginatedList>> getTransactions({int? page, int? register, int? branch}) async {
    try {
      final response = await _transactionApi.getTransactions(page: page, register: register, branch: branch);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
