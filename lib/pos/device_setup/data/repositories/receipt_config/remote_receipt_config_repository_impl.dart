import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';
import 'package:medglobal_admin_portal/pos/device_setup/data/datasources/remote_receipt_config_datasource.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/receipt_config/remote_receipt_config_repository.dart';

class RemoteReceiptConfigRepositoryImpl extends BaseRepository implements RemoteReceiptConfigRepository {
  final RemoteReceiptConfigDataSource _remoteDataSource;

  RemoteReceiptConfigRepositoryImpl({
    required RemoteReceiptConfigDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<ApiResult<ReceiptConfiguration?>> getReceiptConfigByBranch(int id, {int? lastSynced}) {
    return call(() async {
      return await _remoteDataSource.getReceiptConfigByBranch(id, lastSynced);
    });
  }
}
