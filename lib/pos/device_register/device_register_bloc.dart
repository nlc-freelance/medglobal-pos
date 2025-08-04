// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import 'package:medglobal_admin_portal/core/local_db/native/session/session_dao.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
// import 'package:medglobal_admin_portal/pos/device_bios_uuid.dart';
// import 'package:medglobal_admin_portal/pos/device_register/pos_session_service.dart';
//
// part 'device_register_event.dart';
// part 'device_register_state.dart';
// part 'device_register_bloc.freezed.dart';
//
// class DeviceRegisterBloc extends Bloc<DeviceRegisterEvent, DeviceRegisterState> {
//   final RegisterRepository _repository;
//   final PosSessionDao _sessionDao;
//   final PosSessionService _sessionService;
//
//   DeviceRegisterBloc({
//     required RegisterRepository repository,
//     required PosSessionDao sessionDao,
//     required PosSessionService sessionService,
//   })  : _repository = repository,
//         _sessionDao = sessionDao,
//         _sessionService = sessionService,
//         super(const DeviceRegisterState.initial()) {
//     on<_GetAssignedRegister>(_onGetAssignedRegister);
//   }
//
//   Future<void> _onGetAssignedRegister(_GetAssignedRegister event, Emitter<DeviceRegisterState> emit) async {
//     emit(const DeviceRegisterState.loading());
//     try {
//       final result = await _repository.getRegisterBySerialNo();
//
//       result.fold(
//         (failure) {
//           if (failure.message.contains('not found')) {
//             emit(const DeviceRegisterState.unassigned(
//                 'No register found.\nYou\'ll need to assign this device to a register to continue.'));
//           } else {
//             emit(DeviceRegisterState.failure(failure.message));
//           }
//         },
//         (register) {
//           emit(DeviceRegisterState.loaded(register));
//           _sessionDao.setSession(
//             PosSessionCompanion.insert(
//                 employeeId: employeeId,
//                 employeeFirstName: employeeFirstName,
//                 employeeLastName: employeeLastName,
//                 registerId: registerId,
//                 registerName: registerName,
//                 registerSerialNo: registerSerialNo,
//                 branchId: branchId,
//                 branchName: branchName),
//           );
//           _sessionService.setSession(session);
//         },
//       );
//     } catch (e) {
//       emit(DeviceRegisterState.failure(e.toString()));
//     }
//   }
// }
