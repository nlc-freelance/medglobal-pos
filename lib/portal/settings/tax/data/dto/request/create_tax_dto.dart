import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';

part 'create_tax_dto.g.dart';

@JsonSerializable()
class CreateTaxDto {
  final String name;
  final double percentage;
  final bool isDefault;

  CreateTaxDto({
    required this.name,
    required this.percentage,
    required this.isDefault,
  });

  Map<String, dynamic> toJson() => _$CreateTaxDtoToJson(this);

  /// Mapping from domain entity
  factory CreateTaxDto.fromDomain(Tax tax) => CreateTaxDto(
        name: tax.code,
        percentage: tax.rate,
        isDefault: tax.isDefault,
      );
}
