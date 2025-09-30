import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/repository/app_session_repository.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_service.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AppSessionRepository _sessionRepository;
  final GetAuthSession _getAuthSession;
  final ConnectivityService _connectivityService;

  SessionBloc({
    required AppSessionRepository sessionRepository,
    required GetAuthSession getAuthSession,
    required ConnectivityService connectivityService,
  })  : _sessionRepository = sessionRepository,
        _getAuthSession = getAuthSession,
        _connectivityService = connectivityService,
        super(const SessionState.initial()) {
    on<_CheckSession>(_onCheckSession);
    on<_StartSession>(_onStartSession);
    on<_EndSession>(_onEndSession);
  }

  Future<void> _onCheckSession(_CheckSession event, Emitter<SessionState> emit) async {
    emit(const SessionState.loading());

    try {
      final result = await _sessionRepository.getActiveSession();

      User? userSavedLocally;

      result.fold(
        (failure) => emit(SessionState.failure(failure.message)),
        (user) => userSavedLocally = user,
      );

      if (userSavedLocally == null) {
        emit(const SessionState.inactive());
      } else {
        /// If online, check token freshness
        /// Otherwise, skip and just use local db user/session only
        final isOnline = await _connectivityService.isOnline;

        if (isOnline) {
          /// Check if token is not yet expired, Amplify automatically refreshes it
          /// If the refresh token itself is expired, Amplify throws exception which we map to ExpiredTokenFailure
          /// When session is not signed in anymore or when refresh token is expired, we force logout
          final authSession = await _getAuthSession.call(NoParams());

          authSession.fold(
            (failure) {
              if (failure is ExpiredTokenFailure) {
                emit(const SessionState.inactive());
              } else {
                emit(SessionState.failure(failure.message));
              }
            },
            (data) {
              if (data.isLoggedIn == true) {
                GetIt.I<AppSessionService>().setUser(userSavedLocally!);
                emit(SessionState.active(userSavedLocally!));
              } else {
                emit(const SessionState.inactive());
              }
            },
          );
        } else {
          GetIt.I<AppSessionService>().setUser(userSavedLocally!);
          emit(SessionState.active(userSavedLocally!));
        }
      }
    } catch (e) {
      emit(SessionState.failure(e.toString()));
    }
  }

  Future<void> _onStartSession(_StartSession event, Emitter<SessionState> emit) async {
    try {
      final result = await _sessionRepository.saveSession(event.user);

      result.fold(
        (failure) => emit(SessionState.failure(failure.message)),
        (_) {
          _sessionRepository.saveSession(event.user);
          GetIt.I<AppSessionService>().setUser(event.user);
          emit(SessionState.active(event.user));
        },
      );
    } catch (e) {
      emit(SessionState.failure(e.toString()));
    }
  }

  Future<void> _onEndSession(_EndSession event, Emitter<SessionState> emit) async {
    try {
      final result = await _sessionRepository.clearSession();

      result.fold(
        (failure) => emit(SessionState.failure(failure.message)),
        (_) => emit(const SessionState.inactive()),
      );
    } catch (e) {
      emit(SessionState.failure(e.toString()));
    }
  }
}
