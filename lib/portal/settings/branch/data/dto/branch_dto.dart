import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_dto.dart';

part 'branch_dto.freezed.dart';
part 'branch_dto.g.dart';

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

  factory BranchDto.fromJson(Map<String, dynamic> json) => _$BranchDtoFromJson(json);
}
