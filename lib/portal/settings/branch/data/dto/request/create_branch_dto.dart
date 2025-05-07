import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch1.dart';

part 'create_branch_dto.g.dart';

@JsonSerializable()
class CreateBranchDto {
  final String name;
  final String street1;
  final String street2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String businessRegistrationNumber;
  final String? vatIdNumber;

  CreateBranchDto({
    required this.name,
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.businessRegistrationNumber,
    required this.vatIdNumber,
  });

  Map<String, dynamic> toJson() => _$CreateBranchDtoToJson(this);

  /// Mapping from domain entity
  factory CreateBranchDto.fromDomain(Branch1 branch) => CreateBranchDto(
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
