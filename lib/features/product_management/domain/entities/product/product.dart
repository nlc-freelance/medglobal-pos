import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? id;
  final String? name;
  final String? imageUrl;
  final Category? category;
  final List<Variant>? variants;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  final bool? isSelected;

  const Product({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.variants,
    this.createdAt,
    this.updatedAt,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [id, name, category, imageUrl, variants, createdAt, updatedAt, isSelected];

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  bool get hasVariants {
    if (variants?.isNotEmpty == true) return variants!.first.name != 'default';
    return false;
  }

  JSON toProductPostRequest() => {
        'name': name,
        'category': category?.name,
        'productImageUrl': imageUrl,
        'variants': variants
            ?.map((variant) => {
                  if (variant.id != null && variant.id! > 0 == true) 'id': variant.id,
                  'name': variant.name,
                  'sku': variant.sku,
                  'warningStock': variant.warningStock ?? 0,
                  'idealStock': variant.idealStock ?? 0,
                  'cost': variant.cost ?? 0,
                  'suppliers': variant.suppliers?.map((supplier) => supplier.id).toList(),
                  'stores': variant.branchInventories
                      ?.map((branchInventory) => {
                            if (branchInventory.id != null && branchInventory.id! > 0 == true) 'id': branchInventory.id,
                            'store': branchInventory.branch?.id,
                            'price': branchInventory.price,
                            'currentStock': branchInventory.qtyOnHand,
                          })
                      .toList(),
                })
            .toList(),
      };

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'category', value: category?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'createdAt', value: DateFormat.yMd().format(createdAt!)),
        ],
      );

  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    Category? category,
    List<Variant>? variants,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSelected,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      variants: variants ?? this.variants,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
