import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/receipt_config/receipt_config_table.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';

part 'receipt_config_dao.g.dart';

@DriftAccessor(tables: [ReceiptConfig])
class ReceiptConfigDao extends DatabaseAccessor<AppDatabase> with _$ReceiptConfigDaoMixin, BaseDao {
  ReceiptConfigDao(super.db);

  // Insert or replace receipt config
  Future<void> upsertReceiptConfig(ReceiptConfigCompanion config) async {
    return safeCall(() async {
      await into(receiptConfig).insertOnConflictUpdate(config);
    });
  }

  // Fetch the active session
  Future<ReceiptConfigModel?> getReceiptConfig() {
    return safeCall(() async {
      return await (select(receiptConfig)..limit(1)).getSingleOrNull();
    });
  }

  // Clear receipt config
  Future<void> clearReceiptConfig() async {
    return safeCall(() async {
      await delete(receiptConfig).go();
    });
  }
}

extension ReceiptConfigMapper on ReceiptConfiguration {
  ReceiptConfigCompanion get toReceiptConfigCompanion => ReceiptConfigCompanion(
        id: Value(id),
        name: Value(name),
        showBranchName: Value(showBranchName),
        showBranchContact: Value(showBranchContact),
        showFooterMessage: Value(showFooterMessage),
        footerTitle: Value(footerTitle),
        footerMessage: Value(footerMessage),
        companyName: Value(companyName),
        branchName: Value(branchName),
        branchAddress: Value(branchAddress),
        branchPhone: Value(branchPhone),
        branchEmail: Value(branchEmail),
      );
}
