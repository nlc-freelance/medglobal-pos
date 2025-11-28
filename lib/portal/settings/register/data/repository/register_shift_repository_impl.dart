// import 'package:dartz/dartz.dart';
// import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_shift_api_service.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_detail_mapper.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_payload.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift_detail.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_shift_repository.dart';
//
// /// Concrete implementation of [RegisterShiftRepository] that uses [RegisterShiftApiService] for API calls
// /// and [BaseRepository] to centralize error handling.
// class RegisterShiftRepositoryImpl extends BaseRepository implements RegisterShiftRepository {
//   final RegisterShiftApiService _api;
//
//   RegisterShiftRepositoryImpl({required RegisterShiftApiService api}) : _api = api;
//
//   @override
//   Future<Either<Failure, RegisterShift>> openShift({required int registerId, required double amount}) async {
//     return call(() async {
//       final payload = RegisterShiftPayload(
//         register: registerId,
//         status: RegisterShiftStatus.open.name,
//         openingAmount: amount,
//       );
//
//       final response = await _api.openCloseShift(payload);
//       return RegisterShiftMapper.fromDto(response);
//     });
//   }
//
//   @override
//   Future<Either<Failure, RegisterShift>> closeShift({required int registerId, required double amount}) async {
//     return call(() async {
//       final payload = RegisterShiftPayload(
//         register: registerId,
//         status: RegisterShiftStatus.close.name,
//         closingAmount: amount,
//       );
//
//       final response = await _api.openCloseShift(payload);
//       return RegisterShiftMapper.fromDto(response);
//     });
//   }
// }
