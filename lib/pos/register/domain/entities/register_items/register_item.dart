import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'register_item.g.dart';

@JsonSerializable()
class RegisterItem extends Equatable {
  final int? id;
  final String? displayName;
  final int? stock;
  final double? price;

  const RegisterItem({
    this.id,
    this.displayName,
    this.stock,
    this.price,
  });

  @override
  List<Object?> get props => [id, displayName, stock, price];

  Map<String, dynamic> toJson() => _$RegisterItemToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'product_name', value: displayName),
          DataGridCell<int>(columnName: 'stock', value: stock),
          DataGridCell<double>(columnName: 'price', value: price),
        ],
      );
}
