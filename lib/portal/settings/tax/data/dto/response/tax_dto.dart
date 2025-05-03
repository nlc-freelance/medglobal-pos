import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';

part 'tax_dto.freezed.dart';
part 'tax_dto.g.dart';

@freezed
class TaxDto with _$TaxDto {
  const factory TaxDto({
    required int id,
    required String name,
    required double percentage,
    @Default(false) bool isDefault,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _TaxDto;

  factory TaxDto.fromJson(Map<String, dynamic> json) => _$TaxDtoFromJson(json);
}

extension TaxDtoX on TaxDto {
  /// Mapping to domain entity
  Tax toDomain() => Tax(
        id: id,
        code: name,
        rate: percentage,
        isDefault: isDefault,
      );
}
