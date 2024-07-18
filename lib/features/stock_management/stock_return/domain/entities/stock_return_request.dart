import 'package:json_annotation/json_annotation.dart';

part 'stock_return_request.g.dart';

@JsonSerializable()
class StockReturnRequest {
  final int? branch;
  final int? supplier;

  StockReturnRequest({
    this.branch,
    this.supplier,
  });

  Map<String, dynamic> toJson() => _$StockReturnRequestToJson(this);

  StockReturnRequest copyWith({
    int? branch,
    int? supplier,
  }) {
    return StockReturnRequest(
      branch: branch ?? this.branch,
      supplier: supplier ?? this.supplier,
    );
  }
}
