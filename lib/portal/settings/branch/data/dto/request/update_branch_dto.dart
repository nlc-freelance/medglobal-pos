import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'update_branch_dto.g.dart';

@JsonSerializable()
class UpdateBranchDto {
  final int id;
  final String? name;
  final String? phone;
  final String? email;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;
  final String? businessRegistrationNo;
  final String? vatIdNo;
  final int? receiptTemplateId;

  UpdateBranchDto({
    required this.id,
    this.name,
    this.phone,
    this.email,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.zipCode,
    this.country,
    this.businessRegistrationNo,
    this.vatIdNo,
    this.receiptTemplateId,
  });

  Map<String, dynamic> toJson() => _$UpdateBranchDtoToJson(this);

  /// Mapping from domain entity
  factory UpdateBranchDto.fromDomain(Branch branch) => UpdateBranchDto(
        id: branch.id!,
        name: branch.name,
        phone: branch.phone,
        email: branch.email,
        street1: branch.street1,
        street2: branch.street2,
        city: branch.city,
        state: branch.state,
        zipCode: branch.postalCode,
        country: branch.country,
        businessRegistrationNo: branch.businessRegistrationNumber,
        vatIdNo: branch.vatIdNumber,
        receiptTemplateId: branch.receiptTemplate.id,
      );
}
