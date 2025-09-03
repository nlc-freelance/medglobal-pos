enum SideMenuTree {
  PRODUCTS(
    'Product Management',
    ['Products', 'productCreate', 'productDetails', 'Suppliers'],
    // ['Products', 'Add Product', 'Product Details', 'Suppliers'],
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
    ['Sales', 'Sale Details', 'Returns', 'Return Details'],
  ),
  REPORTS(
    'Reports',
    [
      'Product History',
      'Sales Report',
      'Sales Per Category',
      'Sales Per Shift',
      'Sales Per Shift Details',
      'Product Sales History',
      'Product Performance'
    ],
  ),
  settings(
    'Settings',
    [
      'Tax',
      'Branch',
      'New Branch',
      'Branch Details',
      'POS Register',
      'Receipt Template',
      'New Receipt Template',
      'Receipt Template Details'
    ],
  ),
  employee(
    'Employees',
    [
      'Manage Employees',
      'New Employee',
      'Employee Details',
    ],
  );

  final String title;
  final List<String> items;

  const SideMenuTree(this.title, this.items);
}

enum SideMenuTreeItem {
  PRODUCT_MANAGEMENT('Product Management', '/product-management', '/product-management'),
  SUPPLIERS('Suppliers', 'suppliers', '/product-management/suppliers'),

  PRODUCTS('Products', 'products', '/product-management/products'),
  // NEW_PRODUCT('Add Product', 'new', '/product-management/new'),
  // NEW_PRODUCT('Add Product', 'new', '/product-management/new'),
  PRODUCT_DETAILS('productForm', 'products/form/:id?', '/product-management/products/:id'),
  // PRODUCT_DETAILS('Product Details', 'id=:id', '/product-management/products/:id'),

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
  SALE_TRANSACTION_DETAILS('Sale Details', 'id=:id', '/transactions/sales/:id'),
  RETURN_TRANSACTIONS('Returns', 'returns', '/transactions/returns'),
  RETURN_TRANSACTION_DETAILS('Return Details', 'id=:id', '/transactions/returns/:id'),

  MANAGE_RETURNS('Returns Management', '/returns', '/returns'),

  REPORTS('Reports', '/reports', '/reports'),
  PRODUCT_HISTORY('Product History', 'product-history', '/reports/product-history'),
  PRODUCT_SALES_HISTORY('Product Sales History', 'product-sales-history', '/reports/product-sales -history'),
  SALES_REPORT('Sales Report', 'sales', '/reports/sales'),
  SALES_PER_CATEGORY('Sales Per Category', 'sales-per-category', '/reports/sales-per-category'),
  SALES_PER_SHIFT('Sales Per Shift', 'sales-per-shift', '/reports/sales-per-shift'),
  SALES_PER_SHIFT_DETAILS('Sales Per Shift Details', 'id=:id', '/reports/sales-per-shift/:id'),
  productPerformance('Product Performance', 'product-performance', '/reports/product-performance/'),

  settings('Settings', '/settings', '/settings'),
  tax('Tax', 'tax-codes', '/settings/tax'),
  posRegister('POS Register', 'pos-registers', '/settings/pos-registers'),
  branch('Branch', 'branches', 'settings/branches'),
  newBranch('New Branch', 'new', '/settings/branches/new'),
  branchDetails('Branch Details', 'id=:id', 'settings/branches/:id'),
  receiptTemplate('Receipt Template', 'receipt-templates', 'settings/receipt-templates'),
  newReceiptTemplate('New Receipt Template', 'new', '/settings/receipt-templates/new'),
  receiptTemplateDetails('Receipt Template Details', 'id=:id', 'settings/receipt-templates/:id'),

  employees('Employees', '/employees', '/employees'),
  employee('Manage Employees', 'employee', '/employees/employee'),
  newEmployee('New Employee', 'new', '/employees/employee/new'),
  employeeDetails('Employee Details', 'id=:id', '/employees/employee/:id');

  final String name;
  final String path;
  final String route;

  const SideMenuTreeItem(this.name, this.path, this.route);
}
