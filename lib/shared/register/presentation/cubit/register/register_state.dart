part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final int? id;
  final String? name;
  final RegisterShiftStatus status;
  final DateTime? openedAt;
  final DateTime? closedAt;

  const RegisterState({
    this.id,
    this.name,
    this.status = RegisterShiftStatus.close,
    this.openedAt,
    this.closedAt,
  });

  @override
  List<Object?> get props => [id, name, status, openedAt, closedAt];

  factory RegisterState.initial() => const RegisterState();

  bool get isOpen => status == RegisterShiftStatus.open;

  bool get isRegisterNew => status == RegisterShiftStatus.close && openedAt == null && closedAt == null;

  RegisterState copyWith({
    int? id,
    String? name,
    RegisterShiftStatus? status,
    DateTime? openedAt,
    DateTime? closedAt,
  }) {
    return RegisterState(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      openedAt: openedAt ?? this.openedAt,
      closedAt: closedAt ?? this.closedAt,
    );
  }
}
