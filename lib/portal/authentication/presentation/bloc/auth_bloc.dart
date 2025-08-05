import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/confirm_first_time_login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/login.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final ConfirmFirstTimeLogin confirmLoginWithNewPassword;
  final GetAuthSession getAuthSession;
  final Logout logout;

  AuthBloc(
    this.login,
    this.confirmLoginWithNewPassword,
    this.getAuthSession,
    this.logout,
  ) : super(const AuthInitialState()) {
    on<AppInitEvent>(_onAppInit);
    on<LoginEvent>(_login);
    on<ConfirmFirstTimeLoginEvent>(_confirmFirstTimeLogin);
    on<LogoutEvent>(_logout);
  }

  bool getIsAllowed(UserType? type) {
    final isPortalUser = type == UserType.admin;
    final isPosUser = type == UserType.cashier;
    final isBoth = type == UserType.supervisor;

    if (AppConfig.isPortalApp) return isPortalUser || isBoth;
    if (AppConfig.isPOSApp) return isPosUser || isBoth;

    return false;
  }

  void _clearSharedPreferencesOnLogout() async => await SharedPreferencesService.clearPreferences();

  Future<void> _onAppInit(event, emit) async {
    try {
      final result = await getAuthSession.call(NoParams());
      result.fold((error) => emit(AuthErrorState(message: error.message)), (data) {
        final isLoggedIn = data.isLoggedIn == true;
        final isAllowed = getIsAllowed(data.user?.type);

        if (isAllowed) {
          isLoggedIn ? emit(AuthenticatedState(user: data.user!)) : emit(const UnauthenticatedState());
        }
      });
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  // Future<void> _onPosInit(event, emit) async {
  //   try {
  //     final session = await GetIt.I<AppDatabase>().sessionDao.getActiveSession();
  //
  //     if (session == null) {
  //       final isOnline = await GetIt.I<ConnectivityService>().isOnline;
  //
  //       if (isOnline) {}
  //     } else {
  //       // fetch session data from db which is the session above
  //       // load it to the usersessionservice
  //       final User user = User(
  //         id: session.id,
  //         firstName: session.employeeFirstName,
  //         lastName: session.employeeLastName,
  //       );
  //
  //       final Register register = Register(
  //         id: session.registerId,
  //         name: session.registerName,
  //       );
  //
  //       final BranchPartial branch = BranchPartial(
  //         id: session.branchId,
  //         name: session.branchName,
  //       );
  //
  //       GetIt.I<UserSessionService>().setUser(user);
  //       GetIt.I<UserSessionService>().upsertUserAndRegister(user, register, branch);
  //     }
  //
  //     final result = await getAuthSession.call(NoParams());
  //     result.fold((error) => emit(AuthErrorState(message: error.message)), (data) {
  //       final isLoggedIn = data.isLoggedIn == true;
  //       final isAllowed = getIsAllowed(data.user?.type);
  //
  //       if (isAllowed) {
  //         isLoggedIn ? emit(AuthenticatedState(user: data.user!)) : emit(const UnauthenticatedState());
  //       }
  //     });
  //   } catch (e) {
  //     emit(AuthErrorState(message: e.toString()));
  //   }
  // }

  Future<void> _login(event, emit) async {
    emit(const AuthLoadingState());

    try {
      final result = await login.call(LoginParams(event.email, event.password));

      result.fold(
        (error) => emit(AuthErrorState(message: error.message)),
        (data) async {
          final user = data.user;

          if (user == null) {
            emit(const AuthAccessDeniedState(message: 'Login failed. User data is missing.'));
            return;
          }

          final isAllowed = getIsAllowed(data.user?.type);

          if (isAllowed) {
            if (data.isFirstTimeLogin == true) {
              emit(const FirstTimeLoginState());
            } else {
              emit(AuthenticatedState(user: data.user!));
            }
          } else {
            emit(
              const AuthAccessDeniedState(
                message:
                    'Your account is not authorized to use this application.\nContact your administrator if you believe this is an error.',
              ),
            );
            await logout.call(NoParams());
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _confirmFirstTimeLogin(event, emit) async {
    emit(const AuthLoadingState());

    try {
      final result = await confirmLoginWithNewPassword.call(ConfirmFirstTimeLoginParams(event.password));
      result.fold(
        (error) => emit(ConfirmLoginErrorState(message: error.message)),
        (data) => emit(AuthenticatedState(user: data.user!)),
      );
    } catch (e) {
      emit(ConfirmLoginErrorState(message: e.toString()));
    }
  }

  Future<void> _logout(event, emit) async {
    emit(const AuthLoadingState());

    try {
      final result = await logout.call(NoParams());
      result.fold(
        (error) => emit(AuthErrorState(message: error.message)),
        (_) {
          emit(const UnauthenticatedState());
          _clearSharedPreferencesOnLogout();
        },
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
