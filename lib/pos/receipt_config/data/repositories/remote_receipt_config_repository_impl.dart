import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/data/datasources/remote_receipt_config_datasource.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/remote_receipt_config_repository.dart';

class RemoteReceiptConfigRepositoryImpl extends BaseRepository implements RemoteReceiptConfigRepository {
  final RemoteReceiptConfigDataSource _remoteDataSource;

  RemoteReceiptConfigRepositoryImpl({
    required RemoteReceiptConfigDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, ReceiptConfiguration>> getReceiptConfigByBranch(int id, {int? lastSynced}) {
    return call(() async {
      return await _remoteDataSource.getReceiptConfigByBranch(id, lastSynced);
    });
  }
}
