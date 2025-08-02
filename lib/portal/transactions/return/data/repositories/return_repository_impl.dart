import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/api/return_api.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/domain/repositories/return_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/dto/return/update_return_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class ReturnRepositoryImpl implements ReturnRepository {
  final ReturnApi _returnApi;

  ReturnRepositoryImpl(this._returnApi);

  @override
  Future<Either<Failure, Transaction>> update(Transaction transaction) async {
    try {
      final requestDto = UpdateReturnDto.fromDomain(transaction);
      final response = await _returnApi.update(transaction.id, requestDto);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
