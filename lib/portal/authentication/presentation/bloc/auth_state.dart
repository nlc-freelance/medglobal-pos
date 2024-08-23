part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();

  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final User user;
  const AuthenticatedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class FirstTimeLoginState extends AuthState {
  const FirstTimeLoginState();

  @override
  List<Object?> get props => [];
}

class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();

  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ConfirmLoginErrorState extends AuthState {
  final String message;
  const ConfirmLoginErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
