import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';

part 'tax_payload.g.dart';

@JsonSerializable()
class TaxPayload {
  final String? name;
  final double? percentage;
  final bool? isDefault;

  TaxPayload({
    this.name,
    this.percentage,
    this.isDefault,
  });

  Map<String, dynamic> toJson() => _$TaxPayloadToJson(this);

  factory TaxPayload.fromTax(Tax tax) => TaxPayload(
        name: tax.code,
        percentage: tax.rate,
        isDefault: tax.isDefault,
      );
}
