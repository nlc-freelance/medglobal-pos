import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';

class LocalReceiptConfigDataSource {
  final ReceiptConfigDao _dao;

  LocalReceiptConfigDataSource({required ReceiptConfigDao dao}) : _dao = dao;

  Future<void> upsertProducts(ReceiptConfiguration config) async {
    return await _dao.upsertReceiptConfig(config.toReceiptConfigCompanion);
  }

  Future<void> clearReceiptConfig() async {
    return await _dao.clearReceiptConfig();
  }
}
