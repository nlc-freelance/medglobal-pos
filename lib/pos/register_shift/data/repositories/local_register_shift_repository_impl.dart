import 'package:dartz/dartz.dart';

import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/native/register_shift/register_shift_dao.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_local_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';

/// Concrete implementation of [RegisterShiftRepository] that uses [RegisterShiftApiService] for API calls
/// and [BaseRepository] to centralize error handling.
class LocalRegisterShiftRepositoryImpl extends BaseRepository implements LocalRegisterShiftRepository {
  final RegisterShiftLocalDataSource _dataSource;

  LocalRegisterShiftRepositoryImpl({required RegisterShiftLocalDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, RegisterShift>> closeShift(int shiftId, double amount) {
    // TODO: implement closeShift
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> enqueueShift(RegisterShift shift) {
    // TODO: implement enqueueShift
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterShift>> openShift(RegisterShift data) {
    return call(() async {
      final shift = await _dataSource.openShift(data.toRegisterShiftCompanion);
      return shift.toEntity();
    });
  }

  @override
  Future<Either<Failure, RegisterShift>> getShift(int id) {
    return call(() async {
      final shift = await _dataSource.getShiftById(id);
      return shift.toEntity();
    });
  }
}
