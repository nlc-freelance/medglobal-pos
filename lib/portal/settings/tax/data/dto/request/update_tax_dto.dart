import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';

part 'update_tax_dto.g.dart';

@JsonSerializable()
class UpdateTaxDto {
  final int id;
  final String? name;
  final double? percentage;
  final bool? isDefault;

  UpdateTaxDto({
    required this.id,
    this.name,
    this.percentage,
    this.isDefault = false,
  });

  Map<String, dynamic> toJson() => _$UpdateTaxDtoToJson(this);

  /// Mapping from domain entity
  factory UpdateTaxDto.fromDomain(Tax tax) => UpdateTaxDto(
        id: tax.id!,
        name: tax.code,
        percentage: tax.rate,
        isDefault: tax.isDefault,
      );
}
