part of 'register_shift_bloc.dart';

sealed class RegisterShiftEvent extends Equatable {
  const RegisterShiftEvent();

  @override
  List<Object> get props => [];
}

final class RegisterShiftInitEvent extends RegisterShiftEvent {}

final class OpenRegisterShiftEvent extends RegisterShiftEvent {
  final int registerId;
  final double openingAmount;

  const OpenRegisterShiftEvent({required this.registerId, required this.openingAmount});

  @override
  List<Object> get props => [registerId, openingAmount];
}

final class ShowClosingShiftDialogEvent extends RegisterShiftEvent {}

final class HideClosingShiftDialogEvent extends RegisterShiftEvent {}

final class CloseRegisterShiftEvent extends RegisterShiftEvent {
  final int registerId;
  final double closingAmount;

  const CloseRegisterShiftEvent({required this.registerId, required this.closingAmount});

  @override
  List<Object> get props => [registerId, closingAmount];
}

final class ResetRegisterShiftOnLogoutEvent extends RegisterShiftEvent {}
