import 'package:json_annotation/json_annotation.dart';

part 'new_stock_return.g.dart';

@JsonSerializable()
class NewStockReturn {
  final int? branch;
  final int? supplier;

  NewStockReturn({
    this.branch,
    this.supplier,
  });

  Map<String, dynamic> toJson() => _$NewStockReturnToJson(this);

  NewStockReturn copyWith({
    int? branch,
    int? supplier,
  }) {
    return NewStockReturn(
      branch: branch ?? this.branch,
      supplier: supplier ?? this.supplier,
    );
  }
}
