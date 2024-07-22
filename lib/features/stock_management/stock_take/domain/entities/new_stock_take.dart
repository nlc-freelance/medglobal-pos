import 'package:json_annotation/json_annotation.dart';

part 'new_stock_take.g.dart';

@JsonSerializable()
class NewStockTake {
  final int? branch;
  final int? supplier;
  final bool isAllSupplier;

  NewStockTake({
    this.branch,
    this.supplier,
    this.isAllSupplier = false,
  });

  Map<String, dynamic> toJson() => _$NewStockTakeToJson(this);

  NewStockTake copyWith({
    int? branch,
    int? supplier,
    bool? isAllSupplier,
  }) {
    return NewStockTake(
      branch: branch ?? this.branch,
      supplier: supplier ?? this.supplier,
      isAllSupplier: isAllSupplier ?? this.isAllSupplier,
    );
  }
}
