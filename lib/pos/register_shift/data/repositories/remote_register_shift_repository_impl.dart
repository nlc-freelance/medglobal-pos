import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/data/datasources/register_shift_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';

import '../../../../portal/settings/register/data/dto/register_shift/register_shift_payload.dart';
import '../../domain/repositories/remote_register_shift_repository.dart';

/// Concrete implementation of [RemoteRegisterShiftRepository] that uses [RegisterShiftRemoteDataSource] for API calls
/// and [BaseRepository] to centralize error handling.
class RemoteRegisterShiftRepositoryImpl extends BaseRepository implements RemoteRegisterShiftRepository {
  final RegisterShiftRemoteDataSource _dataSource;

  RemoteRegisterShiftRepositoryImpl({required RegisterShiftRemoteDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, void>> sendShift(Map<String, dynamic> payload) {
    // Future<Either<Failure, void>> sendShift(RegisterShift shift) {
    return call(() async {
      // final payload = shift.status == RegisterShiftAction.open.name ? shift.toOpenPayload() : shift.toClosePayload();
      await _dataSource.openOrCloseShift(payload);
    });
  }
}
