import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/response/receipt_template_dto.dart';

part 'branch_dto.freezed.dart';
part 'branch_dto.g.dart';

@freezed
class BranchDto with _$BranchDto {
  const factory BranchDto({
    required int id,
    required String name,
    int? accountId,
    String? code,
    String? street1,
    String? street2,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? phone,
    String? email,
    String? vatIdNo,
    String? businessRegistrationNo,
    ReceiptTemplateDto? receiptTemplate,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
    @DateTimeConverter() DateTime? deletedAt,
  }) = _BranchDto;

  factory BranchDto.fromJson(Map<String, dynamic> json) => _$BranchDtoFromJson(json);
}

extension BranchDtoExt on BranchDto {
  /// Mapping to domain entity
  Branch toDomain() => Branch(
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
      receiptTemplate: receiptTemplate?.toDomain());
}
