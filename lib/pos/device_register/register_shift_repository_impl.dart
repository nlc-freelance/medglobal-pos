// import 'dart:convert';
//
// import 'package:dartz/dartz.dart';
// import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
// import 'package:medglobal_admin_portal/core/errors/errors.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
// import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_queue_dao.dart';
// import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_shift_api_service.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_dto.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_mapper.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_payload.dart';
// import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
// import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
// import 'package:medglobal_admin_portal/pos/device_register/register_shift_local_datasource.dart';
// import 'package:medglobal_admin_portal/pos/device_register/register_shift_remote_datasource.dart';
// import 'package:medglobal_admin_portal/pos/device_register/register_shift_repository.dart';
// import 'package:medglobal_admin_portal/pos/device_register/sync_queue_repository.dart';
// import 'package:medglobal_admin_portal/pos/sync/network_service.dart';
//
// /// Concrete implementation of [RegisterShiftRepository] that uses [RegisterShiftApiService] for API calls
// /// and [BaseRepository] to centralize error handling.
// class RegisterShiftRepositoryImpl extends BaseRepository implements RegisterShiftRepository {
//   final RegisterShiftLocalDataSource _local;
//   final RegisterShiftRemoteDataSource _remote;
//   final SyncQueueRepository _sync;
//   final ConnectivityService _connection;
//
//   RegisterShiftRepositoryImpl({
//     required RegisterShiftLocalDataSource local,
//     required RegisterShiftRemoteDataSource remote,
//     required SyncQueueRepository sync,
//     required ConnectivityService connection,
//   })  : _local = local,
//         _remote = remote,
//         _sync = sync,
//         _connection = connection;
//
//   @override
//   Future<Either<Failure, RegisterShift>> openShift(int userId, int registerId, double amount) {
//     return call(() async {
//       return await _local.openShift(userId, registerId, amount);
//     });
//   }
//
//   @override
//   Future<Either<Failure, RegisterShift>> closeShift(int shiftId, double amount) {
//     return call(() async {
//       return await _local.closeShift(shiftId, amount);
//
//       // final payload = RegisterShiftPayload(
//       //   register: registerId,
//       //   status: RegisterShiftStatus.close.name,
//       //   closingAmount: amount,
//       // );
//       //
//       // final response = await _remote.openCloseShift(payload);
//       // return RegisterShiftMapper.fromDto(response);
//     });
//   }
//
//   @override
//   Future<Either<Failure, RegisterShift>> sendShift(int registerId, RegisterShift shift) {
//     return call(() async {
//       final payload = RegisterShiftPayload(
//         register: registerId,
//         status: shift.status,
//         closingAmount: shift.status == 'open' ? shift.openingAmount : shift.closingAmount,
//         // timestamp: shift.status == 'open' ? shift.openedAt : shift.closedAt,
//       );
//
//       final response = await _remote.openOrCloseShift(payload);
//       return RegisterShiftMapper.fromDto(response);
//     });
//   }
//
//   @override
//   Future<Either<Failure, void>> enqueueShift(RegisterShift shift) {
//     return call(() async {
//       _sync.enqueue(
//         table: 'registerShifts',
//         itemId: shift.id!,
//         data: shift.toPayload(),
//       );
//       // final item = SyncQueueCompanion.insert(
//       //   table: 'transactions',
//       //   action: 'insert',
//       //   payload: jsonEncode(shift.toJson()),
//       //   status: 'pending',
//       // );
//       // await _syncQueueDao.enqueue(item);
//     });
//   }
// }
//
// class RegisterShiftMapper {
//   RegisterShiftMapper._();
//
//   static RegisterShift fromDto(RegisterShiftDto dto) {
//     return RegisterShift(
//       status: dto.status,
//       createdAt: dto.createdAt,
//     );
//   }
// }
