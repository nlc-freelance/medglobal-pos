import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/product_data_source.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_list/supplier_data_source.dart';

mixin DataGridInitMixin<T> {
  BaseDataSource? getDataSource(List<T> data) {
    // BaseDataSource initDataGridSource(List<GridColumn> columns, List<RowData> rows) {
    // BaseDataSource source = BaseDataSource(rowData: rows, columnData: columns);

    if (T == Product) {
      return ProductDataSource(products: data as List<Product>);
    } else if (T == Supplier) {
      return SupplierDataSource(suppliers: data as List<Supplier>);
    }

    return null;

    // source.build();
    // return source;
  }
}

// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/sales_information/variations/variant_data_source.dart';
// import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
// import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_data_source.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// mixin DataGridInitMixin<T> {
//   // BaseDataSource initDataGridSource(List<GridColumn> columns, List<RowData> rows) {
//   BaseDataSource initDataGridSource(List<T> data) {
//     // BaseDataSource source = BaseDataSource(rowData: rows, columnData: columns);
//     BaseDataSource source;

//     // if (T == Variant) {
//     // return VariantDataSource();
//     if (T == Supplier) {
//       source = SupplierDataSource(suppliers: data as List<Supplier>)..build();
//     }

//     return source.build();
//   }
// }




