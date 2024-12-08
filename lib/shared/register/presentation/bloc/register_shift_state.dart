part of 'register_shift_bloc.dart';

sealed class RegisterShiftState extends Equatable {
  const RegisterShiftState();

  @override
  List<Object?> get props => [];
}

final class RegisterShiftInitial extends RegisterShiftState {}

final class RegisterShiftLoading extends RegisterShiftState {}

final class RegisterShiftOpen extends RegisterShiftState {}

final class RegisterShiftClose extends RegisterShiftState {}

final class ShowClosingShiftDialog extends RegisterShiftState {
  final DateTime lastOpenedAt;
  const ShowClosingShiftDialog({required this.lastOpenedAt});

  @override
  List<Object> get props => [lastOpenedAt];
}

final class ShowOpeningShiftDialog extends RegisterShiftState {
  final DateTime? lastClosedAt;
  const ShowOpeningShiftDialog({this.lastClosedAt});

  @override
  List<Object?> get props => [lastClosedAt];
}

final class RegisterShiftError extends RegisterShiftState {
  final String message;
  const RegisterShiftError({required this.message});

  @override
  List<Object> get props => [message];
}
