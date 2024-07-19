import 'package:json_annotation/json_annotation.dart';

part 'new_stock_take.g.dart';

@JsonSerializable()
class NewStockTake {
  final int? targetBranch;
  final int? targetSupplier;
  final bool isAllSupplier;

  NewStockTake({
    this.targetBranch,
    this.targetSupplier,
    this.isAllSupplier = false,
  });

  Map<String, dynamic> toJson() => _$NewStockTakeToJson(this);

  NewStockTake copyWith({
    int? targetBranch,
    int? targetSupplier,
    bool? isAllSupplier,
  }) {
    return NewStockTake(
      targetBranch: targetBranch ?? this.targetBranch,
      targetSupplier: targetSupplier ?? this.targetSupplier,
      isAllSupplier: isAllSupplier ?? this.isAllSupplier,
    );
  }
}
