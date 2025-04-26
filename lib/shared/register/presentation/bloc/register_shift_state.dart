part of 'register_shift_bloc.dart';

sealed class RegisterShiftState extends Equatable {
  const RegisterShiftState();

  @override
  List<Object?> get props => [];
}

final class RegisterShiftInitial extends RegisterShiftState {}

final class RegisterShiftLoading extends RegisterShiftState {}

final class RegisterShiftSuccess extends RegisterShiftState {
  final RegisterShift shift;

  const RegisterShiftSuccess({required this.shift});
  @override
  List<Object?> get props => [shift];
}

final class RegisterShiftError extends RegisterShiftState {
  final String message;

  const RegisterShiftError({required this.message});
  @override
  List<Object?> get props => [message];
}
