import 'package:json_annotation/json_annotation.dart';

part 'new_stock_transfer.g.dart';

@JsonSerializable()
class NewStockTransfer {
  final int? sourceBranchId;
  final int? destinationBranchId;
  final bool? isAutoFill;

  NewStockTransfer({
    this.sourceBranchId,
    this.destinationBranchId,
    this.isAutoFill = false,
  });

  Map<String, dynamic> toJson() => _$NewStockTransferToJson(this);

  NewStockTransfer copyWith({
    int? sourceBranchId,
    int? destinationBranchId,
    bool? isAutoFill,
  }) {
    return NewStockTransfer(
      sourceBranchId: sourceBranchId ?? this.sourceBranchId,
      destinationBranchId: destinationBranchId ?? this.destinationBranchId,
      isAutoFill: isAutoFill ?? this.isAutoFill,
    );
  }
}
