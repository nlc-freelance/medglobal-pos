enum ProfileMenu {
  profile('Account Profile'),
  logout('Logout');

  final String title;
  const ProfileMenu(this.title);
}

enum ProductDeleteAction {
  category('Remove Category'),
  delete('Delete');

  final String title;
  const ProductDeleteAction(this.title);
}

enum SideMenuTree {
  products(
    'Product Management',
    ['Products', 'Add Product', 'Product Details', 'Suppliers'],
  ),
  stocks(
    'Stock Management',
    ['Supply Needs', 'Purchase Orders', 'Stock Returns', 'Stock Takes', 'Stock Transfers'],
  ),
  transacions(
    'Transactions',
    ['Sales', 'Returns'],
  ),
  returns('Returns Management', ['Returns Management']),
  reports(
    'Reports',
    ['Product History', 'Sales Report', 'Sales Per Category', 'Sales Per Branch', 'Sales Per Day'],
  );

  final String title;
  final List<String> items;

  const SideMenuTree(this.title, this.items);
}

enum SideMenuTreeItem {
  productManagement('Product Management', '/product-management', '/product-management'),
  products('Products', 'products', '/product-management/products'),
  newProduct('Add Product', 'add', '/product-management/add'),
  productDetails('Product Details', 'products/id=:id', '/product-management/products/:id'),
  suppliers('Suppliers', 'suppliers', '/product-management/suppliers'),

  stockManagement('Stock Management', '/stock-management', '/stock-management'),
  supplyNeeds('Supply Needs', 'supply-needs', '/stock-management/supply-needs'),
  purchaseOrders('Purchase Orders', 'purchase-orders', '/stock-management/purchase-orders'),
  stockReturns('Stock Returns', 'stock-returns', '/stock-management/stock-returns'),
  stockTakes('Stock Takes', 'stock-takes', '/stock-management/stock-takes'),
  stockTransfers('Stock Transfers', 'stock-transfers', '/stock-management/stock-transfers'),

  transactions('Transactions', '/transactions', '/transactions'),
  saleTransactions('Sales', 'sales', '/transactions/sales'),
  returnTransactions('Returns', 'returns', '/transactions/returns'),

  manageReturns('Returns Management', '/returns', '/returns'),

  reports('Reports', '/reports', '/reports'),
  productHistory('Product History', 'product-history', '/reports/product-history'),
  salesReport('Sales Report', 'sales', '/reports/sales'),
  salesPerCategory('Sales Per Category', 'sales-per-category', '/reports/sales/sales-per-category'),
  salesPerBranch('Sales Per Branch', 'sales-per-branch', '/reports/sales/sales-per-branch'),
  salesPerDay('Sales Per Day', 'sales-per-day', '/reports/sales/sales-per-day');

  final String name;
  final String path;
  final String route;

  const SideMenuTreeItem(this.name, this.path, this.route);
}

enum ToastType {
  error('Oops! Something went wrong'),
  success('Success!'),
  invalid('Missing required fields');

  final String title;
  const ToastType(this.title);
}
