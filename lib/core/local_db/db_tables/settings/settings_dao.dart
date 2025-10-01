import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/settings/settings_table.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';
import 'package:printing/printing.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [Settings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin, BaseDao {
  SettingsDao(super.db);

  Future<String?> getPrinter() {
    return safeCall(() async {
      final row = await (select(settings)..limit(1)).getSingleOrNull();
      return row?.printer;
    });
  }

  Future<void> upsertPrinter(String name) {
    return safeCall(() async {
      // await into(settings).insertOnConflictUpdate(
      //   SettingsCompanion(printer: Value(name)),
      // );
      (update(settings)..where((tbl) => tbl.id.equals(1))).write(SettingsCompanion(printer: Value(name)));
    });
  }

  Future<void> upsertRegisterAndBranch(Register register) {
    return safeCall(() async {
      // await into(settings).insertOnConflictUpdate(
      //   AppSettingsCompanion(
      //     id: const Value(1),
      //     registerId: Value(register.id!),
      //     registerName: Value(register.name),
      //     registerSerialNo: Value(register.serialNumber!),
      //     branchId: Value(register.assignedBranch!.id!),
      //     branchName: Value(register.assignedBranch!.name),
      //   ),
      // );

      final existing = await (select(settings)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();

      final companion = SettingsCompanion(
        id: const Value(1),
        registerId: Value(register.id!),
        registerName: Value(register.name),
        registerSerialNo: Value(register.serialNumber!),
        branchId: Value(register.assignedBranch!.id!),
        branchName: Value(register.assignedBranch!.name),
      );

      if (existing == null) {
        await into(settings).insert(companion);
      } else {
        await (update(settings)..where((tbl) => tbl.id.equals(1))).write(companion);
      }
    });
  }

  Future<void> upsertReceiptConfig(ReceiptConfiguration config) {
    return safeCall(() async {
      // await into(settings).insertOnConflictUpdate(
      //   AppSettingsCompanion(
      //     id: const Value(1),
      //     receiptConfig: Value(jsonEncode(config.toJson())),
      //   ),
      // );

      final existing = await (select(settings)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();

      final companion = SettingsCompanion(
        id: const Value(1),
        receiptConfig: Value(jsonEncode(config.toJson())),
      );

      if (existing == null) {
        await into(settings).insert(companion);
      } else {
        await (update(settings)..where((tbl) => tbl.id.equals(1))).write(companion);
      }
    });
  }

  // Get settings (always single row)
  Future<SettingsModel?> getSettings() => (select(settings)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();

  Future<ReceiptConfiguration?> getReceiptConfigJson() async {
    final row = await (select(settings)..where((tbl) => tbl.id.equals(1))).getSingleOrNull();

    if (row?.receiptConfig == null) return null;

    final data = jsonDecode(row!.receiptConfig!);

    return ReceiptConfiguration(
      id: data['id'] as int,
      name: data['name'] as String,
      accountId: data['accountId'] as int,
      showBranchName: data['showBranchName'] as bool,
      showBranchContact: data['showBranchContact'] as bool,
      showFooterMessage: data['showFooterMessage'] as bool,
      footerTitle: data['footerTitle'] as String?,
      footerMessage: data['footerMessage'] as String?,
      companyName: data['companyName'] as String?,
      branchName: data['branchName'] as String?,
      branchAddress: data['branchAddress'] as String?,
      branchPhone: data['branchPhone'] as String?,
      branchEmail: data['branchEmail'] as String?,
    );
  }

  Future<void> clearAll() async {
    return safeCall(() async {
      await delete(settings).go();
    });
  }

  Future<void> clearPrinterSetting() async {
    const companion = SettingsCompanion(
      id: Value(1),
      printer: Value(null),
    );
    await (update(settings)..where((table) => table.id.equals(1))).write(companion);
  }
}

extension SettingsMapper on SettingsModel {
  DeviceSettings? toEntity() {
    return [
      registerId,
      registerName,
      registerSerialNo,
      branchId,
      branchName,
      receiptConfig,
    ].any((data) => data == null)
        ? null
        : DeviceSettings(
            register: RegisterPartial(id: registerId!, name: registerName!, serialNumber: registerSerialNo!),
            branch: BranchPartial(id: branchId!, name: branchName!),
            receiptConfig: ReceiptConfiguration.fromJson(jsonDecode(receiptConfig!)),
            printer: printer,
          );
  }

  RegisterPartial? get register {
    return [registerId, registerName, registerSerialNo].any((data) => data == null)
        ? null
        : RegisterPartial(
            id: registerId!,
            name: registerName!,
            serialNumber: registerSerialNo,
          );
  }

  BranchPartial? get branch {
    return [branchId, branchName].any((data) => data == null)
        ? null
        : BranchPartial(
            id: branchId!,
            name: branchName!,
          );
  }

  Printer? toPrinterEntity() {
    return printer == null ? null : Printer(url: printer!);
  }
}
