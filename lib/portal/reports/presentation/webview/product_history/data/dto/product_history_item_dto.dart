import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_item.dart';

part 'product_history_item_dto.g.dart';

@JsonSerializable()
class ProductHistoryItemDto {
  final int? transactionId;
  final DateTime? dateTime;
  final String? employeeName;
  final String? action;
  final int? qtyBefore;
  final int? qtyAfter;
  final int? difference;

  const ProductHistoryItemDto({
    this.transactionId,
    this.dateTime,
    this.employeeName,
    this.action,
    this.qtyBefore,
    this.qtyAfter,
    this.difference,
  });

  factory ProductHistoryItemDto.fromJson(Map<String, dynamic> json) => _$ProductHistoryItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductHistoryItemDtoToJson(this);

  ProductHistoryItem toEntity() => ProductHistoryItem(
        id: transactionId,
        dateTime: dateTime,
        employeeName: employeeName,
        action: _action,
        qtyBefore: qtyBefore,
        change: difference,
        qtyAfter: qtyAfter,
      );

  ProductHistoryAction? get _action {
    switch (action) {
      case 'purchase':
        return ProductHistoryAction.PURCHASE;
      case 'return':
        return ProductHistoryAction.RETURN;
      case 'take':
        return ProductHistoryAction.TAKE;
      case 'transfer':
        return ProductHistoryAction.TRANSFER;
      case 'sale':
        return ProductHistoryAction.SALE;
      case 'initial':
        return ProductHistoryAction.INITIAL;
      default:
        return null;
    }
  }
}
