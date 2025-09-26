import 'package:dartz/dartz.dart';

import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_local_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';

/// Concrete implementation of [RegisterShiftRepository] that uses [RegisterShiftApiService] for API calls
/// and [BaseRepository] to centralize error handling.
class LocalRegisterShiftRepositoryImpl extends BaseRepository implements LocalRegisterShiftRepository {
  final RegisterShiftLocalDataSource _dataSource;

  LocalRegisterShiftRepositoryImpl({required RegisterShiftLocalDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, RegisterShift?>> getOpenShift(int registerId) {
    return call(() async {
      final shift = await _dataSource.getOpenShift(registerId);
      if (shift == null) return null;
      return shift.toEntity();
    });
  }

  @override
  Future<Either<Failure, RegisterShift>> openShift(RegisterShift data) {
    return call(() async {
      final shift = await _dataSource.openShift(data);
      return shift.toEntity();
    });
  }

  @override
  Future<Either<Failure, RegisterShift>> closeShift(int shiftId, double amount) {
    return call(() async {
      final shift = await _dataSource.closeShift(shiftId, amount);
      return shift.toEntity();
    });
  }

  @override
  Future<Either<Failure, RegisterShift?>> getLastClosedShift(int registerId) {
    return call(() async {
      final shift = await _dataSource.getLastClosedShift(registerId);
      return shift?.toEntity();
    });
  }

  @override
  Future<Either<Failure, RegisterShift>> getShiftById(int id) {
    return call(() async {
      final shift = await _dataSource.getShiftById(id);
      return shift.toEntity();
    });
  }
}
