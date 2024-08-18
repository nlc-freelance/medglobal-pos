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

  static List<ColumnData> SUPPLY_NEEDS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty', 'Qty'),
    ColumnData('warning_stock', 'Warning Stock Level'),
    ColumnData('ideal_stock', 'Ideal Stock Level'),
    ColumnData('suppliers', 'Suppliers'),
  ];

  static List<ColumnData> PURCHASE_ORDERS = [
    ColumnData('id', 'ID'),
    ColumnData('date', 'Date'),
    ColumnData('est_date_arrival', 'Estimated Date of Arrival'),
    ColumnData('target_branch', 'Target Branch'),
    ColumnData('supplier', 'Supplier'),
    ColumnData('total_amount', 'Amount (PHP)'),
    ColumnData('status', 'Status'),
  ];

  static List<ColumnData> PO_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name', minWidth: 300),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_on_hand', 'Qty on Hand'),
    ColumnData('qty_to_order', 'Qty to Order'),
    ColumnData('supplier_price', 'Supplier Price (PHP)'),
    ColumnData('total', 'Total (PHP)'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> PO_ITEMS_RECEIVED = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_ordered', 'Ordered Qty'),
    ColumnData('qty_received', 'Received Qty'),
    ColumnData('supplier_price', 'Supplier Price (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
  ];

  static List<ColumnData> STOCK_RETURNS = [
    ColumnData('id', 'ID'),
    ColumnData('date', 'Date'),
    ColumnData('from_branch', 'From Branch'),
    ColumnData('supplier', 'Supplier'),
    ColumnData('total_amount', 'Amount (PHP)'),
    ColumnData('status', 'Status'),
  ];

  static List<ColumnData> SR_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_on_hand', 'Qty on Hand'),
    ColumnData('qty_to_return', 'Qty to Return'),
    ColumnData('supplier_price', 'Supplier Price (PHP)'),
    ColumnData('total', 'Total (PHP)'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> SR_ITEMS_RETURNED = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_on_hand', 'Qty on Hand'),
    ColumnData('qty_to_return', 'Returned Qty'),
    ColumnData('supplier_price', 'Supplier Price (PHP)'),
    ColumnData('total', 'Total (PHP)'),
  ];

  static List<ColumnData> STOCK_TAKES = [
    ColumnData('id', 'ID'),
    ColumnData('start_time', 'Start Time'),
    ColumnData('complete_time', 'Complete Time'),
    ColumnData('description', 'Description'),
    ColumnData('branch', 'Branch'),
    ColumnData('supplier', 'Supplier'),
    ColumnData('status', 'Status'),
  ];

  static List<ColumnData> ST_UNCOUNTED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_expected', 'Expected Qty'),
    ColumnData('qty_counted', 'Counted Qty'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> ST_COUNTED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_expected', 'Expected Qty'),
    ColumnData('qty_counted', 'Counted Qty'),
    ColumnData('difference', 'Difference'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> ST_COMPLETED_COUNTED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_expected', 'Expected Qty'),
    ColumnData('qty_counted', 'Counted Qty'),
    ColumnData('difference', 'Difference'),
    ColumnData('cost_difference', 'Cost Difference'),
  ];

  static List<ColumnData> STOCK_TRANSFERS = [
    ColumnData('id', 'ID'),
    ColumnData('created_date', 'Created Date'),
    ColumnData('source_branch', 'Source Branch'),
    ColumnData('destination_branch', 'Destination Branch'),
    ColumnData('status', 'Status'),
  ];

  static List<ColumnData> STOCK_TRANSFER_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_at_source', 'Qty at Source'),
    ColumnData('qty_at_destination', 'Qty at Destination'),
    ColumnData('qty_to_transfer', 'Qty to Transfer'),
    ColumnData('cost', 'Cost (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> STOCK_TRANSFER_ITEMS_SHIPPED = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_to_transfer', 'Transferred Qty'),
    ColumnData('qty_received', 'Received Qty'),
    ColumnData('cost', 'Cost (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
  ];

  static List<ColumnData> STOCK_ITEMS_TRANSFERRED = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_transferred', 'Transferred Quantity'),
    ColumnData('qty_received', 'Received Quantity'),
    ColumnData('cost', 'Cost (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
  ];

  static List<ColumnData> SALE_TRANSACTIONS = [
    ColumnData('id', 'ID'),
    ColumnData('receipt_id', 'Receipt ID'),
    ColumnData('date', 'Date', minWidth: 180),
    ColumnData('register_id', 'Register'),
    ColumnData('branch', 'Branch'),
    ColumnData('employee', 'Employee'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
    ColumnData('discount_in_peso', 'Discount (PHP)'),
    ColumnData('tax', 'Tax (PHP)'),
    ColumnData('total', 'Total (PHP)'),
  ];

  static List<ColumnData> SALE_TRANSACTIONS_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty', 'Qty'),
    ColumnData('price', 'Price (PHP)'),
    ColumnData('discount_in_peso', 'Discount (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
  ];

  static List<ColumnData> RETURN_TRANSACTION_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Product'),
    ColumnData('sku', 'SKU'),
    ColumnData('restockQty', 'Restock Qty'),
    ColumnData('writeOffQty', 'Write-off Qty'),
    ColumnData('comment', 'Comment'),
  ];

  /// POS
  ///
  static List<ColumnData> REGISTER_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('product_name', 'Product', minWidth: 400),
    ColumnData('stock', 'Stock', minWidth: 80),
    ColumnData('price', 'Price (PHP)', minWidth: 80),
  ];

  static List<ColumnData> ORDERED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Product'),
    ColumnData('qty', 'Qty'),
    ColumnData('price', 'Price'),
    ColumnData('discount', 'Discount'),
    ColumnData('subtotal', 'Subtotal'),
  ];

  static List<ColumnData> ORDERED_ITEMS_EDITABLE = [
    ColumnData('id', 'ID'),
    ColumnData('is_selected', ''),
    ColumnData('name', 'Product', minWidth: 350),
    ColumnData('qty_to_refund', 'Qty to Refund'),
    ColumnData('qty', ''),
    ColumnData('price', 'Price'),
    ColumnData('subtotal', 'Subtotal'),
  ];
  static List<ColumnData> REFUNDED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Product', minWidth: 350),
    ColumnData('qty_refunded', 'Qty Refunded'),
    ColumnData('price', 'Price'),
    ColumnData('subtotal', 'Subtotal'),
  ];
}
