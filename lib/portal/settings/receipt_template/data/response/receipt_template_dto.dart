import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'receipt_template_dto.freezed.dart';
part 'receipt_template_dto.g.dart';

@freezed
class ReceiptTemplateDto with _$ReceiptTemplateDto {
  const factory ReceiptTemplateDto({
    required int id,
    required String name,
    String? description,
    @Default(false) bool isSystemDefault,
    @Default(false) bool isDefault,
    @Default(false) bool showCompanyName,
    @Default(false) bool showBranchName,
    @Default(false) bool showBranchAddress,
    @Default(false) bool showBranchContactDetails,
    @Default(false) bool showFooterMessage,
    String? footerTitle,
    String? footerMessage,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _ReceiptTemplateDto;

  factory ReceiptTemplateDto.fromJson(Map<String, dynamic> json) => _$ReceiptTemplateDtoFromJson(json);
}

extension ReceiptTemplateDtoExt on ReceiptTemplateDto {
  /// Mapping to domain entity
  ReceiptTemplate toDomain() => ReceiptTemplate(
        id: id,
        name: name,
        description: description,
        isSystemDefault: isSystemDefault,
        isDefault: isDefault,
        showCompanyName: showCompanyName,
        showBranchAddress: showBranchAddress,
        showBranchContactDetails: showBranchContactDetails,
        showFooterMessage: showFooterMessage,
        footerTitle: footerTitle,
        footerMessage: footerMessage,
      );
}
