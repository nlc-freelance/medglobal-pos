part of 'active_register_cubit.dart';

class ActiveRegisterState extends Equatable {
  final int? id;
  final String? name;
  final RegisterShiftStatus status;
  final DateTime? openedAt;
  final DateTime? closedAt;

  const ActiveRegisterState({
    this.id,
    this.name,
    this.status = RegisterShiftStatus.closed,
    this.openedAt,
    this.closedAt,
  });

  @override
  List<Object?> get props => [id, name, status, openedAt, closedAt];

  factory ActiveRegisterState.initial() => const ActiveRegisterState();

  bool get isOpen => status == RegisterShiftStatus.open;

  bool get isRegisterNew => status == RegisterShiftStatus.closed && openedAt == null && closedAt == null;

  ActiveRegisterState copyWith({
    int? id,
    String? name,
    RegisterShiftStatus? status,
    DateTime? openedAt,
    DateTime? closedAt,
  }) {
    return ActiveRegisterState(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      openedAt: openedAt ?? this.openedAt,
      closedAt: closedAt ?? this.closedAt,
    );
  }
}
