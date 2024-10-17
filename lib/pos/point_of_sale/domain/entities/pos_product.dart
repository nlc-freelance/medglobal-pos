import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'pos_product.g.dart';

@JsonSerializable()
class POSProduct extends Equatable {
  final int? id;
  final String? displayName;
  final int? stock;
  final double? price;

  const POSProduct({
    this.id,
    this.displayName,
    this.stock,
    this.price,
  });

  @override
  List<Object?> get props => [id, displayName, stock, price];

  Map<String, dynamic> toJson() => _$POSProductToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'product_name', value: displayName),
          DataGridCell<int>(columnName: 'stock', value: stock),
          DataGridCell<double>(columnName: 'price', value: price),
        ],
      );
}
