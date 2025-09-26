import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';

part 'register_shift_dao.g.dart';

@DriftAccessor(tables: [RegisterShifts])
class RegisterShiftDao extends DatabaseAccessor<AppDatabase> with _$RegisterShiftDaoMixin, BaseDao {
  RegisterShiftDao(super.db);

  // Get the currently open shift by user, if there is
  // Future<RegisterShiftModel?> getOpenShift(int userId, int registerId) {
  //   return safeCall(() async {
  //     return await (select(registerShifts)
  //           ..where(
  //             (tbl) => tbl.userId.equals(userId) & tbl.registerId.equals(registerId) & tbl.closedAt.isNull(),
  //           ))
  //         .getSingleOrNull();
  //   });
  // }

  /// Get the current open shift
  Future<RegisterShiftModel?> getOpenShift(int registerId) {
    return safeCall(() async {
      return await (select(registerShifts)
            ..where(
              (tbl) => tbl.registerId.equals(registerId) & tbl.closedAt.isNull(),
            ))
          .getSingleOrNull();
    });
  }

  // Create a new shift
  Future<int> createShift(RegisterShiftsCompanion shift) {
    return safeCall<int>(() async {
      return await into(registerShifts).insert(
        shift.copyWith(openedAt: Value(DateTime.now())),
      );
    });
  }

  // Close shift
  Future<void> closeShift(int id, double closingAmount) async {
    final shift = RegisterShiftsCompanion(
      status: const Value('closed'),
      closingAmount: Value(closingAmount),
      closedAt: Value(DateTime.now()),
    );

    await (update(registerShifts)..where((tbl) => tbl.id.equals(id))).write(shift);
  }

  // Get the last closed shift
  Future<RegisterShiftModel?> getLastClosedShift(int registerId) {
    return safeCall(() async {
      return (select(registerShifts)
            ..where((tbl) => tbl.registerId.equals(registerId) & tbl.closedAt.isNotNull())
            ..orderBy([
              (tbl) => OrderingTerm.desc(tbl.closedAt),
            ])
            ..limit(1))
          .getSingleOrNull();
    });
  }

  // // Get the last closed shift by user
  // Future<RegisterShiftModel?> getLastClosedShiftByUser(int userId, int registerId) {
  //   return safeCall(() async {
  //     return (select(registerShifts)
  //       ..where((tbl) => tbl.userId.equals(userId) & tbl.registerId.equals(registerId) & tbl.closedAt.isNotNull())
  //       ..orderBy([
  //             (tbl) => OrderingTerm.desc(tbl.closedAt),
  //       ])
  //       ..limit(1))
  //         .getSingleOrNull();
  //   });
  // }

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
