import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';

/// For simplicity, ID should always be the first column.
/// ID columns are hidden in the DataGrid display.
class DataGridColumn {
  static List<ColumnData> products = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Name'),
    ColumnData('category', 'Category'),
    ColumnData('createdAt', 'Created At'),
  ];

  static List<ColumnData> suppliers = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Name', minWidth: 200),
    ColumnData('email', 'Email'),
    ColumnData('phone', 'Phone'),
  ];

  static List<ColumnData> branchInventories = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Branch'),
    ColumnData('price', 'Price'),
    ColumnData('qty_on_hand', 'Qty on Hand'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> variants = [
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

  static List<ColumnData> purchaseOrders = [
    ColumnData('id', 'ID', minWidth: 80),
    ColumnData('date', 'Date', minWidth: 120),
    ColumnData('est_date_arrival', 'Estimated Date of Arrival', minWidth: 200),
    ColumnData('target_branch', 'Target Branch', minWidth: 220),
    ColumnData('supplier', 'Supplier', minWidth: 220),
    ColumnData('total_amount', 'Amount (PHP)', minWidth: 130),
    ColumnData('status', 'Status', minWidth: 150),
  ];

  static List<ColumnData> PO_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name', minWidth: 250),
    ColumnData('sku', 'SKU', minWidth: 200),
    ColumnData('selling_price', 'Selling Price (PHP)', minWidth: 100),
    ColumnData('qty_on_hand', 'Qty on Hand', minWidth: 100),
    ColumnData('qty_to_order', 'Qty to Order', minWidth: 100),
    ColumnData('supplier_price', 'Supplier Price (PHP)', minWidth: 120),
    ColumnData('total', 'Total (PHP)', minWidth: 100),
    ColumnData('action', 'Action', minWidth: 100),
  ];

  static List<ColumnData> PO_ITEMS_RECEIVED = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name', minWidth: 330),
    ColumnData('sku', 'SKU', minWidth: 200),
    ColumnData('qty_ordered', 'Ordered Qty'),
    ColumnData('qty_received', 'Received Qty'),
    ColumnData('supplier_price', 'Supplier Price (PHP)'),
    ColumnData('total', 'Total (PHP)'),
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
    ColumnData('name', 'Variant Name', minWidth: 330),
    ColumnData('sku', 'SKU', minWidth: 200),
    ColumnData('qty_on_hand', 'Qty on Hand'),
    ColumnData('qty_to_return', 'Qty to Return'),
    ColumnData('supplier_price', 'Supplier Price (PHP)'),
    ColumnData('total', 'Total (PHP)'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> SR_ITEMS_RETURNED = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name', minWidth: 330),
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
    ColumnData('variant_name', 'Variant Name', minWidth: 400),
    ColumnData('sku', 'SKU', minWidth: 200),
    ColumnData('qty_expected', 'Expected Qty'),
    ColumnData('qty_counted', 'Counted Qty'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> ST_COUNTED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name', minWidth: 400),
    ColumnData('sku', 'SKU', minWidth: 200),
    ColumnData('qty_expected', 'Expected Qty'),
    ColumnData('qty_counted', 'Counted Qty'),
    ColumnData('difference', 'Difference'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> ST_COMPLETED_COUNTED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('variant_name', 'Variant Name', minWidth: 400),
    ColumnData('sku', 'SKU', minWidth: 200),
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
    ColumnData('total', 'Total (PHP)'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> STOCK_TRANSFER_ITEMS_SHIPPED = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_to_transfer', 'Transferred Qty'),
    ColumnData('qty_received', 'Received Qty'),
    ColumnData('cost', 'Cost (PHP)'),
    ColumnData('total', 'Total (PHP)'),
  ];

  static List<ColumnData> STOCK_ITEMS_TRANSFERRED = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Variant Name'),
    ColumnData('sku', 'SKU'),
    ColumnData('qty_transferred', 'Transferred Quantity'),
    ColumnData('qty_received', 'Received Quantity'),
    ColumnData('cost', 'Cost (PHP)'),
    ColumnData('total', 'Total (PHP)'),
  ];

  static List<ColumnData> SALE_TRANSACTIONS = [
    ColumnData('id', 'ID'),
    ColumnData('receipt_id', 'Receipt ID', minWidth: 330),
    ColumnData('date', 'Date', minWidth: 150),
    ColumnData('branch', 'Branch', minWidth: 160),
    ColumnData('register', 'Register', minWidth: 180),
    ColumnData('employee', 'Employee', minWidth: 180),
    ColumnData('subtotal', 'Subtotal (PHP)', minWidth: 120),
    ColumnData('total_discount', 'Discount (PHP)', minWidth: 120),
    ColumnData('tax', 'Tax (PHP)', minWidth: 120),
    ColumnData('total', 'Total (PHP)', minWidth: 120),
  ];

  static List<ColumnData> SALE_TRANSACTIONS_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Name', minWidth: 330),
    ColumnData('sku', 'SKU'),
    ColumnData('qty', 'Qty'),
    ColumnData('price', 'Price (PHP)'),
    ColumnData('discount', 'Discount (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
  ];

  static List<ColumnData> RETURN_TRANSACTIONS = [
    ColumnData('id', 'ID'),
    ColumnData('receipt_id', 'Receipt ID', minWidth: 230),
    ColumnData('date', 'Date', minWidth: 150),
    ColumnData('branch', 'Branch', minWidth: 180),
    ColumnData('employee', 'Employee', minWidth: 180),
    ColumnData('total', 'Total (PHP)', minWidth: 100),
    ColumnData('reason_for_return', 'Reason for Return', minWidth: 180),
    ColumnData('status', 'Status', minWidth: 180),
  ];

  static List<ColumnData> RETURN_TRANSACTIONS_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Product', minWidth: 330),
    ColumnData('sku', 'SKU'),
    ColumnData('return_qty', 'Returned Qty'),
    ColumnData('write_off_qty', 'Write-off Qty'),
    ColumnData('restock_qty', 'Restock Qty'),
    ColumnData('comment', 'Comment', minWidth: 350),
  ];

  static List<ColumnData> PRODUCT_HISTORY = [
    ColumnData('id', 'ID'),
    ColumnData('datetime', 'Datetime', minWidth: 200),
    ColumnData('employee_name', 'Employee', minWidth: 200),
    ColumnData('action', 'Action', minWidth: 180),
    ColumnData('qty_before', 'Qty Before', minWidth: 180),
    ColumnData('change', 'Change', minWidth: 180),
    ColumnData('qty_after', 'Qty After', minWidth: 180),
  ];

  static List<ColumnData> productSaleHistory = [
    ColumnData('id', 'ID'),
    ColumnData('datetime', 'Datetime'),
    ColumnData('type', 'Type'),
    ColumnData('unit_cost', 'Unit Cost'),
    ColumnData('selling_price', 'Selling Price'),
    ColumnData('volume_sold', 'Volume Sold'),
    ColumnData('gross_sales', 'Gross Sales'),
    ColumnData('discount', 'Discount'),
    ColumnData('net_sales', 'Net Sales'),
  ];

  static List<ColumnData> SALES_PER_CATEGORY = [
    ColumnData('group_by', 'Group By'),
    ColumnData('product_category', 'Product Category', minWidth: 220),
    ColumnData('total_items_sold', 'Total Items Sold', minWidth: 150),
    ColumnData('total_items_returned', 'Total Items Returned', minWidth: 150),
    ColumnData('item_net_count', 'Item Net Count', minWidth: 150),
    ColumnData('total_sales_amt', 'Total Sales Amount', minWidth: 150),
    ColumnData('total_returned_amt', 'Total Returned Amount', minWidth: 150),
    ColumnData('total_discount_amt', 'Total Discount Amount', minWidth: 150),
    ColumnData('item_net_sales', 'Item Net Sales', minWidth: 150),
  ];

  static List<ColumnData> SALES_PER_SHIFT = [
    ColumnData('id', 'ID'),
    ColumnData('open_time', 'Open Time', minWidth: 180),
    ColumnData('close_time', 'Close Time', minWidth: 180),
    ColumnData('branch', 'Branch', minWidth: 200),
    ColumnData('register', 'Register', minWidth: 200),
    ColumnData('total_sale_transactions', 'Total Sale Transactions', minWidth: 180),
    ColumnData('total_sales_amt', 'Total Sales Amount', minWidth: 180),
  ];
  static List<ColumnData> SALES_SUMMARY = [
    ColumnData('type', 'Type'),
    ColumnData('transactions', 'Transactions'),
    ColumnData('amount', 'Amount (PHP)'),
  ];
  static List<ColumnData> CASH_DRAWER_SUMMARY = [
    ColumnData('type', 'Type'),
    ColumnData('amount', 'Amount (PHP)'),
  ];

  static List<ColumnData> SHIFT_TRANSACTIONS = [
    ColumnData('id', 'ID'),
    ColumnData('receipt_id', 'Receipt ID', minWidth: 220),
    ColumnData('date', 'Date', minWidth: 180),
    ColumnData('employee', 'Employee', minWidth: 180),
    ColumnData('type', 'Type'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
    ColumnData('total_discount', 'Discount (PHP)'),
    ColumnData('tax', 'Tax (PHP)'),
    ColumnData('total', 'Total (PHP)'),
  ];

  /// POS
  ///
  static List<ColumnData> productCatalog = [
    ColumnData('id', 'ID'),
    ColumnData('product_name', 'Product', minWidth: 400),
    ColumnData('stock', 'Stock', minWidth: 80),
    ColumnData('price', 'Price (PHP)', minWidth: 80),
  ];

  static List<ColumnData> ORDERED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Product', minWidth: 350),
    ColumnData('qty', 'Qty'),
    ColumnData('price', 'Price (PHP)'),
    ColumnData('discount', 'Discount (PHP)'),
    ColumnData('subtotal', 'Subtotal (PHP)'),
  ];

  static List<ColumnData> ORDERED_ITEMS_EDITABLE = [
    ColumnData('id', 'ID'),
    ColumnData('is_selected', ''),
    ColumnData('name', 'Product', minWidth: 350),
    ColumnData('qty_to_refund', 'Qty to Refund'),
    ColumnData('qty', ''),
    ColumnData('price', 'Price'),
    ColumnData('discount', 'Unit Discount'),
    ColumnData('subtotal', 'Subtotal'),
  ];

  static List<ColumnData> REFUNDED_ITEMS = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Product', minWidth: 350),
    ColumnData('qty_refunded', 'Qty Refunded'),
    ColumnData('price', 'Price'),
    ColumnData('subtotal', 'Subtotal'),
  ];

  static List<ColumnData> taxCodes = [
    ColumnData('id', 'ID'),
    ColumnData('tax_code', 'Tax Code'),
    ColumnData('tax_rate', 'Tax Rate (%)'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> registers = [
    ColumnData('id', 'ID'),
    ColumnData('register_name', 'Register Name'),
    ColumnData('assigned_branch', 'Assigned Branch'),
    ColumnData('action', 'Action'),
  ];

  static List<ColumnData> branches = [
    ColumnData('id', 'ID'),
    ColumnData('branch_name', 'Branch Name'),
    ColumnData('phone', 'Phone'),
    ColumnData('address', 'Address'),
  ];

  static List<ColumnData> receiptTemplates = [
    ColumnData('id', 'ID'),
    ColumnData('receipt_template_name', 'Receipt Template'),
    ColumnData('receipt_template_description', 'Description'),
  ];

  static List<ColumnData> employees = [
    ColumnData('id', 'ID'),
    ColumnData('employee_name', 'Name'),
    ColumnData('branch', 'Branch'),
    ColumnData('email', 'Email'),
    ColumnData('phone', 'Phone'),
    ColumnData('role', 'Role'),
  ];

  static List<ColumnData> productPerformanceReports = [
    ColumnData('id', 'ID'),
    ColumnData('name', 'Report Name'),
    ColumnData('action', 'Action'),
  ];
}
