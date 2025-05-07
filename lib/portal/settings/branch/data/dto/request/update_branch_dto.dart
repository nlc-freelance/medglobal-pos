import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch1.dart';

part 'update_branch_dto.g.dart';

@JsonSerializable()
class UpdateBranchDto {
  final int id;
  final String? name;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? businessRegistrationNumber;
  final String? vatIdNumber;

  UpdateBranchDto({
    required this.id,
    this.name,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.businessRegistrationNumber,
    this.vatIdNumber,
  });

  Map<String, dynamic> toJson() => _$UpdateBranchDtoToJson(this);

  /// Mapping from domain entity
  factory UpdateBranchDto.fromDomain(Branch1 branch) => UpdateBranchDto(
        id: branch.id!,
        name: branch.name,
        street1: branch.street1,
        street2: branch.street2,
        city: branch.city,
        state: branch.state,
        postalCode: branch.postalCode,
        country: branch.country,
        businessRegistrationNumber: branch.businessRegistrationNumber,
        vatIdNumber: branch.vatIdNumber,
      );
}
