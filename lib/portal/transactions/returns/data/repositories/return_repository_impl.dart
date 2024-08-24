import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/data/api/return_api.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/domain/repositories/return_repository.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

class ReturnRepositoryImpl implements ReturnRepository {
  final ReturnApi _returnApi;

  ReturnRepositoryImpl(this._returnApi);

  @override
  Future<Either<Failure, Transaction>> update(Transaction transaction) async {
    try {
      final response = await _returnApi.update(transaction);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
