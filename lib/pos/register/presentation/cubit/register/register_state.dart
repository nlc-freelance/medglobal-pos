part of 'register_cubit.dart';

@JsonSerializable()
class RegisterState extends Equatable {
  const RegisterState(this.register, this.error);

  final Register? register;
  final String? error;

  @override
  List<Object?> get props => [register, error];

  factory RegisterState.fromJson(Map<String, dynamic> json) => _$RegisterStateFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterStateToJson(this);
}
