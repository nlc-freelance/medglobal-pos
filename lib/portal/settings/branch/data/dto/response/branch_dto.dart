import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/response/receipt_template_dto.dart';

part 'branch_dto.freezed.dart';
part 'branch_dto.g.dart';

@freezed
class BranchLiteDto with _$BranchLiteDto {
  const factory BranchLiteDto({
    required int id,
    required String name,
    required String address,
    String? phone,
  }) = _BranchLiteDto;

  const BranchLiteDto._();

  factory BranchLiteDto.fromJson(Map<String, dynamic> json) => _$BranchLiteDtoFromJson(json);

  factory BranchLiteDto.fromDomain(BranchLite branch) => BranchLiteDto(
        id: branch.id,
        name: branch.name,
        address: branch.address,
      );

  BranchLite toDomain() => BranchLite(
        id: id,
        name: name,
        phone: phone,
        address: address,
      );
}

@freezed
class BranchDto with _$BranchDto {
  const factory BranchDto({
    required int id,
    required String name,
    required int accountId,
    String? code,
    required String street1,
    String? street2,
    required String city,
    required String state,
    String? zipCode,
    String? country,
    required String phone,
    String? email,
    String? vatIdNo,
    required String businessRegistrationNo,
    required ReceiptTemplateDto receiptTemplate,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
    @DateTimeConverter() DateTime? deletedAt,
  }) = _BranchDto;

  const BranchDto._();

  factory BranchDto.fromJson(Map<String, dynamic> json) => _$BranchDtoFromJson(json);

  Branch toEntity() => Branch(
        id: id,
        name: name,
        accountId: accountId,
        code: code,
        street1: street1,
        street2: street2,
        city: city,
        state: state,
        postalCode: zipCode,
        country: country,
        phone: phone,
        email: email,
        businessRegistrationNumber: businessRegistrationNo,
        vatIdNumber: vatIdNo,
        receiptTemplate: receiptTemplate.toDomain(),
      );
}
