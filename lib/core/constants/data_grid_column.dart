import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';

/// For simplicity, ID should always be the first column.
/// ID columns are hidden in the DataGrid display.
class DataGridColumn {
  static List<ColumnData> PRODUCTS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Name'),
    ColumnData('category', 'Category'),
    ColumnData('createdAt', 'Created At'),
  ];

  static List<ColumnData> SUPPLIERS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Name'),
    ColumnData('email', 'Email'),
    ColumnData('phone', 'Phone'),
  ];
  static List<ColumnData> BRANCH_INVENTORIES = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Branch'),
    ColumnData('price', 'Price'),
    ColumnData('qty_on_hand', 'Qty on Hand'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> VARIANTS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant'),
    ColumnData('sku', 'SKU'),
    ColumnData('branches', 'Branches'),
    ColumnData('suppliers', 'Suppliers'),
    ColumnData('action', 'Action'),
  ];
}
