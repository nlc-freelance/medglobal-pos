import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
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

  Future<void> _onAppInit(event, emit) async {
    try {
      final result = await getAuthSession.call(NoParams());
      result.fold(
          (error) => emit(AuthErrorState(message: error.message)),
          (data) => data.isLoggedIn == true
              ? emit(AuthenticatedState(user: data.user!))
              : emit(const UnauthenticatedState()));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _login(event, emit) async {
    emit(const AuthLoadingState());

    try {
      final result = await login.call(LoginParams(event.email, event.password));
      result.fold(
        (error) => emit(AuthErrorState(message: error.message)),
        (data) => data.isFirstTimeLogin == true
            ? emit(const FirstTimeLoginState())
            : emit(AuthenticatedState(user: data.user!)),
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
        (error) => emit(AuthErrorState(message: error.message)),
        (data) => emit(AuthenticatedState(user: data.user!)),
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _logout(event, emit) async {
    emit(const AuthLoadingState());

    try {
      final result = await logout.call(NoParams());
      result.fold(
        (error) => emit(AuthErrorState(message: error.message)),
        (_) => emit(const UnauthenticatedState()),
      );
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
