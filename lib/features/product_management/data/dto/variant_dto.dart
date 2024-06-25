import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/constants/strings.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/variant.dart';

part 'variant_dto.g.dart';

@JsonSerializable()
class VariantDto extends Equatable {
  final int? id;
  final String? name; //
  // final String sku; //
  final double? price; //
  final List<int>? suppliers;
  // final int qtyOnHand; //
  final int? warningStock;
  final int? idealStock;

  const VariantDto({
    this.id,
    this.name,
    this.price,
    this.suppliers,
    this.warningStock,
    this.idealStock,
  });

  @override
  List<Object?> get props => [id, name, price, suppliers, warningStock, idealStock];

  factory VariantDto.fromJson(Map<String, dynamic> json) => _$VariantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VariantDtoToJson(this);

  Variant toEntity() => Variant(
        id: id,
        name: name ?? Strings.empty, //
        price: price ?? 0.0, //
        suppliers: suppliers,
        warningStock: warningStock,
        idealStock: idealStock,
      );
}
