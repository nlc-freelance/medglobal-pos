// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:get_it/get_it.dart';
// import 'package:medglobal_admin_portal/core/errors/errors.dart';
// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
// import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
// import 'package:medglobal_admin_portal/pos/app_session/domain/usecases/initialize_app_session_usecase.dart';
// import 'package:printing/printing.dart';
//
// part 'app_session_event.dart';
// part 'app_session_state.dart';
// part 'app_session_bloc.freezed.dart';
//
// class AppSessionBloc extends Bloc<AppSessionEvent, AppSessionState> {
//   final InitializeAppSessionUseCase _initializeAppSessionUseCase;
//   // final RegisterRepository _registerRepository;
//   // final LocalReceiptConfigRepository _localReceiptConfigRepo;
//   // final RemoteReceiptConfigRepository _remoteReceiptConfigRepo;
//   // final SessionDao _sessionDao;
//   // final AppSessionService _sessionService;
//
//   AppSessionBloc({
//     required InitializeAppSessionUseCase initializeAppSessionUseCase,
//     // required RegisterRepository registerRepository,
//     // required LocalReceiptConfigRepository localReceiptConfigRepo,
//     // required RemoteReceiptConfigRepository remoteReceiptConfigRepo,
//     // required SessionDao sessionDao,
//     // required AppSessionService sessionService,
//   })  : _initializeAppSessionUseCase = initializeAppSessionUseCase,
//         // _registerRepository = registerRepository,
//         // _localReceiptConfigRepo = localReceiptConfigRepo,
//         // _remoteReceiptConfigRepo = remoteReceiptConfigRepo,
//         // _sessionDao = sessionDao,
//         // _sessionService = sessionService,
//         super(const AppSessionState.initial()) {
//     on<_InitializeSession>(_onInitSession);
//   }
//
//   /// The POS system becomes available only when the following conditions are met:
//   ///
//   ///  - A valid user is successfully authenticated
//   ///  - Register details are fetched and correctly linked to the device
//   ///  - All of the user and register details has been successfully stored locally
//   ///
//   /// POS functionality should remain inaccessible until all conditions are true.
//   Future<void> _onInitSession(_InitializeSession event, Emitter<AppSessionState> emit) async {
//     emit(const AppSessionState.loading());
//
//     // await Future.delayed(Duration(seconds: 3));
//
//     try {
//       final user = event.user;
//
//       final result = await _initializeAppSessionUseCase.call(user);
//
//       result.fold(
//         (failure) {
//           final String message; // Internet Connection Required
//           if (failure is NetworkFailure) {
//             message =
//                 'This application needs an active internet connection on startup to set things up and initialize. After that, you can use it offline.';
//           } else {
//             message =
//                 'This device must be linked to a register before it can be used. Please complete the setup on the portal or contact your administrator for assistance.';
//           }
//
//           emit(AppSessionState.failure(message, failure.message));
//         },
//         (session) => emit(AppSessionState.loaded(session)),
//       );
//
//       // await result.fold(
//       //   (failure) {
//       //     final String message; // Internet Connection Required
//       //     if (failure is NetworkFailure) {
//       //       message =
//       //           'This application needs an active internet connection on startup to set things up and initialize. After that, you can use it offline.';
//       //     } else {
//       //       message =
//       //           'This device must be linked to a register before it can be used. Please complete the setup on the portal or contact your administrator for assistance.';
//       //     }
//       //
//       //     emit(AppSessionState.failure(message, failure.message));
//       //   },
//       //   (register) async {
//       //     final session = AppSession(
//       //       employeeId: user.id!,
//       //       employeeFirstName: user.firstName!,
//       //       employeeLastName: user.lastName!,
//       //       registerId: register.id!,
//       //       registerName: register.name,
//       //       registerSerialNo: register.serialNumber!,
//       //       branchId: register.assignedBranch!.id!,
//       //       branchName: register.assignedBranch!.name,
//       //     );
//       //
//       //     await _sessionDao.insertSession(session.toDriftCompanion());
//       //     _sessionService.upsertSessionDetails(
//       //       user,
//       //       register,
//       //       BranchPartial(
//       //         id: register.assignedBranch!.id!,
//       //         name: register.assignedBranch!.name,
//       //       ),
//       //     );
//       //
//       //     emit(AppSessionState.loaded(session));
//       //   },
//       // );
//     } catch (e) {
//       final message =
//           '${e.runtimeType == LocalDatabaseException ? 'Failed to save session data on this device.' : 'An unexpected error occurred.'} This may cause issues when working offline. Please try again or contact support.';
//       emit(AppSessionState.failure(message, e.toString(), type: e.runtimeType));
//     }
//   }
// }
