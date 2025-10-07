import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

abstract class LocalReceiptConfigRepository {
  Future<ApiResult<void>> upsertReceiptConfig(ReceiptConfiguration config);
  Future<ApiResult<void>> clearReceiptConfig();
}
