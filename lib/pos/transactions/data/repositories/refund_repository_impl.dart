import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/refund_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';

class RefundRepositoryImpl implements RefundRepository {
  final RefundApi _refundApi;

  RefundRepositoryImpl(this._refundApi);

  @override
  Future<Either<Failure, Transaction>> create(Transaction transaction) async {
    try {
      final response = await _refundApi.create(transaction);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
