import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';

part 'stock_transfer_item_dto.g.dart';

@JsonSerializable()
class StockTransferItemDto extends Equatable {
  final int? id;
  final VariantDto? variant;
  @JsonKey(name: 'currentStock')
  final int? qtyAtSource;
  @JsonKey(name: 'destinationQuantity')
  final int? qtyAtDestination;
  @JsonKey(name: 'transferredQuantity')
  final int? qtyToTransfer;
  final double? cost;

  const StockTransferItemDto({
    this.id,
    this.variant,
    this.qtyAtSource,
    this.qtyAtDestination,
    this.qtyToTransfer,
    this.cost,
  });

  @override
  List<Object?> get props => [id, variant, qtyAtSource, qtyAtDestination, qtyToTransfer];

  factory StockTransferItemDto.fromJson(Map<String, dynamic> json) => _$StockTransferItemDtoFromJson(json);

  StockTransferItem toEntity() => StockTransferItem(
        id: id,
        name: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qtyAtSource: qtyAtSource,
        qtyAtDestination: qtyAtDestination,
        qtyToTransfer: qtyToTransfer,
        cost: cost,
      );
}
