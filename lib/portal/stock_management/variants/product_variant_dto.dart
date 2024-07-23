import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_dto.dart';
import 'package:uuid/uuid.dart';

part 'product_variant_dto.g.dart';

@JsonSerializable()
class ProductVariantDto extends Equatable {
  final int? id;
  final String? name;
  final String? displayName;
  final String? sku;
  final int? warningStock;
  final int? idealStock;
  @JsonKey(name: 'currentStock')
  final int? qtyOnHand;
  final double? cost;
  final double? price;
  final ProductDto? product;
  final List<SupplierDto>? suppliers; //

  const ProductVariantDto({
    this.displayName,
    this.id,
    this.name,
    this.sku,
    this.warningStock,
    this.idealStock,
    this.qtyOnHand,
    this.cost,
    this.price,
    this.suppliers,
    this.product,
  });

  @override
  List<Object?> get props => [id, name, sku, warningStock, idealStock, qtyOnHand, cost, price, suppliers, product];

  factory ProductVariantDto.fromJson(Map<String, dynamic> json) => _$ProductVariantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantDtoToJson(this);

  /// Add Item in Purchase Order - Items to Order
  /// Add a temporary ID for they are not yet added in the database as products of the current PO.
  /// Used negative to keep track of local vs remote data
  PurchaseOrderItem toPurchaseOrderItem() => PurchaseOrderItem(
        id: -(const Uuid().v4().hashCode),
        variantId: id,
        name: displayName,
        sku: sku,
        qtyOnHand: qtyOnHand,
      );

  StockReturnItem toStockReturnItem() => StockReturnItem(
        id: -(const Uuid().v4().hashCode),
        variantId: id,
        name: displayName,
        sku: sku,
        qtyOnHand: qtyOnHand,
      );

  StockTransferItem toStockTransferItem() => StockTransferItem(
        id: -(const Uuid().v4().hashCode),
        variantId: id,
        name: displayName,
        sku: sku,
        qtyAtSource: qtyOnHand,
      );
}
