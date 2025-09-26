import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/refund/remote_refund_datasource.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund/remote_refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class RemoteRefundRepositoryImpl extends BaseRepository implements RemoteRefundRepository {
  final RemoteRefundDataSource _remoteDataSource;

  RemoteRefundRepositoryImpl({required RemoteRefundDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Transaction>> createRefund(CreateRefundDto payload) {
    return call(() async {
      final response = await _remoteDataSource.createRefund(payload);
      return response.toDomain();
    });
  }
}
