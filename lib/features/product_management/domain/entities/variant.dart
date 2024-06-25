import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant extends Equatable {
  final int? id;
  final String name;
  // final String sku; //
  final double price;
  // final double cost; //
  final List<int>? suppliers;
  // final int qtyOnHand; //
  final int? warningStock;
  final int? idealStock;

  const Variant({
    this.id,
    required this.name,
    // required this.sku, //
    required this.price,
    // required this.cost, //
    // required this.qtyOnHand, //
    this.suppliers,
    this.warningStock,
    this.idealStock,
  });

  @override
  List<Object?> get props => [id, name, price, suppliers, warningStock, idealStock];

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);

  VariantDto toDto() => VariantDto(
        name: name,
        // sku: sku, //
        price: price,
        // cost: const, //
        suppliers: suppliers,
        // qtyOnHand: qtyOnHand, //
        warningStock: warningStock,
        idealStock: idealStock,
      );

  dynamic get(String prop) => prop;
}
