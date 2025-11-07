import 'package:json_annotation/json_annotation.dart';

part 'new_stock_transfer.g.dart';

@JsonSerializable()
class NewStockTransfer {
  final int? fromBranch;
  final int? toBranch;
  final bool? isAutoFill;

  NewStockTransfer({
    this.fromBranch,
    this.toBranch,
    this.isAutoFill = false,
  });

  Map<String, dynamic> toJson() => _$NewStockTransferToJson(this);

  NewStockTransfer copyWith({
    int? fromBranch,
    int? toBranch,
    bool? isAutoFill,
  }) {
    return NewStockTransfer(
      fromBranch: fromBranch ?? this.fromBranch,
      toBranch: toBranch ?? this.toBranch,
      isAutoFill: isAutoFill ?? this.isAutoFill,
    );
  }
}
