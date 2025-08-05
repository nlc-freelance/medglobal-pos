import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/pos/device_register/pos_session_service.dart';
import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/pos_session.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final RegisterRepository _registerRepository;
  final SessionDao _sessionDao;
  final UserSessionService _userSessionService;

  SessionBloc({
    required RegisterRepository registerRepository,
    required SessionDao sessionDao,
    required UserSessionService userSessionService,
  })  : _registerRepository = registerRepository,
        _sessionDao = sessionDao,
        _userSessionService = userSessionService,
        super(const SessionState.initial()) {
    on<_InitializeSession>(_onInitSession);
  }

  /// The POS system becomes available only when the following conditions are met:
  ///
  ///  - A valid user is successfully authenticated
  ///  - Register details are fetched and correctly linked to the device
  ///  - All of the user and register details has been successfully stored locally
  ///
  /// POS functionality should remain inaccessible until all conditions are true.
  Future<void> _onInitSession(_InitializeSession event, Emitter<SessionState> emit) async {
    emit(const SessionState.loading());

    // await Future.delayed(Duration(seconds: 3));

    try {
      final user = event.user;

      final result = await _registerRepository.getRegisterBySerialNo();

      await result.fold(
        (failure) {
          final String message; // Internet Connection Required
          if (failure is NetworkFailure) {
            message =
                'This application needs an active internet connection on startup to set things up and initialize. After that, you can use it offline.';
          } else {
            message =
                'This device must be linked to a register before it can be used. Please complete the setup on the portal or contact your administrator for assistance.';
          }

          emit(SessionState.failure(message, failure.message));
        },
        (register) async {
          final session = PosSession(
            employeeId: user.id!,
            employeeFirstName: user.firstName!,
            employeeLastName: user.lastName!,
            registerId: register.id!,
            registerName: register.name,
            registerSerialNo: register.serialNumber!,
            branchId: register.assignedBranch!.id!,
            branchName: register.assignedBranch!.name,
          );

          await _sessionDao.insertSession(session.toDriftCompanion());
          _userSessionService.upsertUserAndRegister(
            user,
            register,
            BranchPartial(
              id: register.assignedBranch!.id!,
              name: register.assignedBranch!.name,
            ),
          );

          emit(SessionState.loaded(session));
        },
      );
    } catch (e) {
      final message =
          '${e.runtimeType == LocalDatabaseException ? 'Failed to save session data on this device.' : 'An unexpected error occurred.'} This may cause issues when working offline. Please try again or contact support.';
      emit(SessionState.failure(message, e.toString(), type: e.runtimeType));
    }
  }
}
