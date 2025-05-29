import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

part 'update_register_dto.g.dart';

@JsonSerializable()
class UpdateRegisterDto {
  final int id;
  final String? name;
  final int? storeId;

  UpdateRegisterDto({
    required this.id,
    this.name,
    this.storeId,
  });

  Map<String, dynamic> toJson() => _$UpdateRegisterDtoToJson(this);

  /// Mapping from domain entity
  factory UpdateRegisterDto.fromDomain(Register register) => UpdateRegisterDto(
        id: register.id!,
        name: register.name,
        storeId: register.assignedBranch?.id,
      );
}
