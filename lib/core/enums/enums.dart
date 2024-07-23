enum ProfileMenu {
  PROFILE('Account Profile'),
  LOGOUT('Logout');

  final String title;
  const ProfileMenu(this.title);
}

enum SideMenuTree {
  PRODUCTS(
    'Product Management',
    ['Products', 'Add Product', 'Product Details', 'Suppliers'],
  ),
  STOCKS(
    'Stock Management',
    [
      'Supply Needs',
      'Purchase Orders',
      'New Purchase Order',
      'Purchase Order Details',
      'Stock Returns',
      'New Stock Return',
      'Stock Return Details',
      'Stock Takes',
      'Stock Take Details',
      'Stock Transfers',
      'New Stock Transfer',
      'Stock Transfer Details',
    ],
  ),
  TRANSACTIONS(
    'Transactions',
    ['Sales', 'Returns'],
  ),
  RETURNS('Returns Management', ['Returns Management']),
  REPORTS(
    'Reports',
    ['Product History', 'Sales Report', 'Sales Per Category', 'Sales Per Branch', 'Sales Per Day'],
  );

  final String title;
  final List<String> items;

  const SideMenuTree(this.title, this.items);
}

enum SideMenuTreeItem {
  PRODUCT_MANAGEMENT('Product Management', '/product-management', '/product-management'),
  SUPPLIERS('Suppliers', 'suppliers', '/product-management/suppliers'),

  PRODUCTS('Products', 'products', '/product-management/products'),
  NEW_PRODUCT('Add Product', 'new', '/product-management/new'),
  PRODUCT_DETAILS('Product Details', 'id=:id', '/product-management/products/:id'),

  STOCK_MANAGEMENT('Stock Management', '/stock-management', '/stock-management'),
  SUPPLY_NEEDS('Supply Needs', 'supply-needs', '/stock-management/supply-needs'),

  PURCHASE_ORDERS('Purchase Orders', 'purchase-orders', '/stock-management/purchase-orders'),
  NEW_PURCHASE_ORDER('New Purchase Order', 'new', '/stock-management/purchase-orders/new'),
  PURCHASE_ORDER_DETAILS('Purchase Order Details', 'id=:id', '/stock-management/purchase-orders/:id'),

  STOCK_RETURNS('Stock Returns', 'stock-returns', '/stock-management/stock-returns'),
  NEW_STOCK_RETURN('New Stock Return', 'new', '/stock-management/stock-returns/new'),
  STOCK_RETURN_DETAILS('Stock Return Details', 'id=:id', '/stock-management/stock-returns/:id'),

  STOCK_TAKES('Stock Takes', 'stock-takes', '/stock-management/stock-takes'),
  STOCK_TAKE_DETAILS('Stock Take Details', 'id=:id', '/stock-management/stock-takes/:id'),

  STOCK_TRANSFERS('Stock Transfers', 'stock-transfers', '/stock-management/stock-transfers'),
  NEW_STOCK_TRANSFER('New Stock Transfer', 'new', '/stock-management/stock-transfers/new'),
  STOCK_TRANSFER_DETAILS('Stock Transfer Details', 'id=:id', '/stock-management/stock-transfers/:id'),

  TRANSACTIONS('Transactions', '/transactions', '/transactions'),
  SALE_TRANSACTIONS('Sales', 'sales', '/transactions/sales'),
  RETURN_TRANSACTIONS('Returns', 'returns', '/transactions/returns'),

  MANAGE_RETURNS('Returns Management', '/returns', '/returns'),

  REPORTS('Reports', '/reports', '/reports'),
  PRODUCT_HISTORY('Product History', 'product-history', '/reports/product-history'),
  SALES_REPORT('Sales Report', 'sales', '/reports/sales'),
  SALES_PER_CATEGORY('Sales Per Category', 'sales-per-category', '/reports/sales/sales-per-category'),
  SALES_PER_BRANCH('Sales Per Branch', 'sales-per-branch', '/reports/sales/sales-per-branch'),
  SALES_PER_DAY('Sales Per Day', 'sales-per-day', '/reports/sales/sales-per-day');

  final String name;
  final String path;
  final String route;

  const SideMenuTreeItem(this.name, this.path, this.route);
}

enum ToastType {
  ERROR('Oops! Something went wrong'),
  SUCCESS('Success!'),
  INVALID('Missing required fields');

  final String title;
  const ToastType(this.title);
}

enum SupplyNeedsAction {
  NEW_PURCHASE_ORDER('New Purchase Order'),
  NEW_STOCK_TRANSFER('New Stock Transfer'),
  DOWNLOAD_CSV('Download CSV');

  final String label;
  const SupplyNeedsAction(this.label);
}

enum StockOrderStatus {
  NEW('New'),
  FOR_RECEIVING('For Receiving'),
  IN_PROGRESS('In Progress'),
  SHIPPED('Shipped'),
  COMPLETED('Completed'),
  CANCELLED('Cancelled');

  final String label;
  const StockOrderStatus(this.label);
}

enum StockOrderUpdate {
  SAVE,
  SAVE_AND_MARK_AS_SHIPPED,
  SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS,
  SAVE_AND_RECEIVED,
  MARK_AS_COMPLETE,
  CANCEL,
}

enum StockTakeItemAction {
  DO_NOTHING('Do nothing'),
  SET_QTY_TO_ZERO('Set quantity to 0');

  final String label;
  const StockTakeItemAction(this.label);
}

enum UserType { CASHIER, ADMIN }
