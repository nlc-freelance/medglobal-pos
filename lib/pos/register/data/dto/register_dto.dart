import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDto extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'store')
  final Branch? branch;

  const RegisterDto({
    this.id,
    this.name,
    this.branch,
  });

  @override
  List<Object?> get props => [id, name, branch];

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

  Register toEntity() => Register(
        id: id,
        name: name,
        branch: branch,
      );
}
