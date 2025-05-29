import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

part 'create_register_dto.g.dart';

@JsonSerializable()
class CreateRegisterDto {
  final String name;
  final int storeId;

  CreateRegisterDto({
    required this.name,
    required this.storeId,
  });

  Map<String, dynamic> toJson() => _$CreateRegisterDtoToJson(this);

  /// Mapping from domain entity
  factory CreateRegisterDto.fromDomain(Register register) => CreateRegisterDto(
        name: register.name,
        storeId: register.assignedBranch!.id!,
      );
}
