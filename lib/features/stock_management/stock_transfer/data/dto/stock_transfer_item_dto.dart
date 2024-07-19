import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';

part 'stock_transfer_item_dto.g.dart';

@JsonSerializable()
class StockTransferItemDto extends Equatable {
  final int? id;
  final ProductVariantDto? variant;
  @JsonKey(name: 'fromCurrentStock')
  final int? qtyAtSource;
  @JsonKey(name: 'toCurrentStock')
  final int? qtyAtDestination;
  @JsonKey(name: 'quantityToTransfer')
  final int? qtyToTransfer;
  @JsonKey(name: 'receivedQuantity')
  final int? qtyReceived;

  const StockTransferItemDto({
    this.id,
    this.variant,
    this.qtyAtSource,
    this.qtyAtDestination,
    this.qtyToTransfer,
    this.qtyReceived,
  });

  @override
  List<Object?> get props => [id, variant, qtyAtSource, qtyAtDestination, qtyToTransfer, qtyReceived];

  factory StockTransferItemDto.fromJson(Map<String, dynamic> json) => _$StockTransferItemDtoFromJson(json);

  StockTransferItem toEntity() => StockTransferItem(
        id: id,
        variantId: variant?.id,
        name: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qtyAtSource: qtyAtSource,
        qtyAtDestination: qtyAtDestination,
        qtyToTransfer: qtyToTransfer,
        cost: variant?.cost,
        subtotal: (qtyToTransfer ?? 0) * (variant?.cost ?? 0),
      );
}
