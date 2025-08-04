import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/native/register_shift/register_shift_table.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';

import '../../../../pos/register_shift/domain/entities/register_shift.dart';

part 'register_shift_dao.g.dart';

@DriftAccessor(tables: [RegisterShifts])
class RegisterShiftDao extends DatabaseAccessor<AppDatabase> with _$RegisterShiftDaoMixin, BaseDao {
  RegisterShiftDao(super.db);

  Future<int> insertShift(RegisterShiftsCompanion shift) {
    return safeCall<int>(() async {
      return await into(registerShifts).insert(
        shift.copyWith(
          status: const Value('open'),
          openedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<void> updateShift(int id, double closingAmount) async {
    final shift = RegisterShiftsCompanion(
      status: const Value('close'),
      closingAmount: Value(closingAmount),
      closedAt: Value(DateTime.now()),
    );

    await (update(registerShifts)..where((tbl) => tbl.id.equals(id))).write(shift);
  }

  Future<RegisterShiftModel> getShiftById(int id) async {
    final shift = await (select(registerShifts)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

    if (shift == null) {
      throw UnexpectedException('Register shift not found');
    }

    return shift;
  }
}

extension RegisterShiftModelMapper on RegisterShiftModel {
  RegisterShift toEntity() {
    return RegisterShift(
      id: id,
      status: status,
      openingAmount: openingAmount,
      closingAmount: closingAmount,
      openedAt: openedAt,
      closedAt: closedAt,
      userId: userId,
      registerId: registerId,
    );
  }
}

extension RegisterShiftDriftExt on RegisterShift {
  RegisterShiftsCompanion get toRegisterShiftCompanion => RegisterShiftsCompanion(
        userId: Value(userId),
        registerId: Value(registerId),
        status: Value(status),
        openingAmount: Value(openingAmount),
        closingAmount: Value(closingAmount),
      );

  SyncQueueCompanion get toSyncQueueCompanion => SyncQueueCompanion(
        itemId: Value(id!),
        userId: Value(userId),
        table: const Value('registerShifts'),
        data: Value(jsonEncode(toJson())),
      );
}
