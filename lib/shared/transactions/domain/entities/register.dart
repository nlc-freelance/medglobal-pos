import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';

@JsonSerializable()
class Register extends Equatable {
  final int? id;
  final String? name;
  final String? serialNumber;

  const Register({
    this.id,
    this.name,
    this.serialNumber,
  });

  @override
  List<Object?> get props => [id, name, serialNumber];

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
