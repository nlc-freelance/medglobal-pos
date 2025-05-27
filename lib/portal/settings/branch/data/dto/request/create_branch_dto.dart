import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'create_branch_dto.g.dart';

@JsonSerializable()
class CreateBranchDto {
  final int accountId;
  final String name;
  final String phone;
  final String? email;
  final String street1;
  final String? street2;
  final String city;
  final String state;
  final String? zipCode;
  final String? country;
  final String businessRegistrationNo;
  final String? vatIdNo;
  final int receiptTemplateId;

  CreateBranchDto({
    required this.accountId,
    required this.name,
    required this.phone,
    this.email,
    required this.street1,
    this.street2,
    required this.city,
    required this.state,
    this.zipCode,
    this.country,
    required this.businessRegistrationNo,
    this.vatIdNo,
    required this.receiptTemplateId,
  });

  Map<String, dynamic> toJson() => _$CreateBranchDtoToJson(this);

  /// Mapping from domain entity
  factory CreateBranchDto.fromDomain(Branch branch) => CreateBranchDto(
        name: branch.name,
        accountId: branch.accountId,
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
        receiptTemplateId: branch.receiptTemplate.id!,
      );
}
