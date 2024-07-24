part of 'register_shift_bloc.dart';

sealed class RegisterShiftState extends Equatable {
  const RegisterShiftState();

  @override
  List<Object?> get props => [];
}

final class RegisterShiftInitial extends RegisterShiftState {}

final class RegisterShiftLoading extends RegisterShiftState {}

final class RegisterShiftOpen extends RegisterShiftState {
  // final RegisterShift? shift;
  // final DateTime? openSince;
  // const RegisterShiftOpen({this.shift, this.openSince});

  // @override
  // List<Object?> get props => [shift, openSince];
}

final class RegisterShiftClose extends RegisterShiftState {
  // final RegisterShift? shift;
  // const RegisterShiftClose({this.shift});

  // @override
  // List<Object?> get props => [shift];
}

final class ShowClosingShiftDialog extends RegisterShiftState {
  final DateTime openSince;
  const ShowClosingShiftDialog({required this.openSince});

  @override
  List<Object> get props => [openSince];
}

final class RegisterShiftError extends RegisterShiftState {
  final String message;
  const RegisterShiftError({required this.message});

  @override
  List<Object> get props => [message];
}
