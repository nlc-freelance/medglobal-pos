class ApiEndpoints {
  ApiEndpoints._();

  /// Supplier
  static const String suppliers = '/suppliers';
  static String supplierById(int id) => '/$suppliers/$id';

  /// Products
  static const String products = '/products';
  static String productById(int id) => '/$products/$id';

  /// Product Category
  static const String productCategories = '/product-categories';

  /// Product Variants
  static const String productVariants = '$products/variants';
  static const String productVariantsDeltaSync = '$products/variants/delta-sync';

  static String productHistory(int variantId) => '$productVariants/$variantId/history';
  static String productSalesHistory(int variantId) => '$productVariants/$variantId/sales-history';

  /// Branch
  static const String branches = '/stores';
  static String branchById(int id) => '$branches/$id';
  static String receiptConfigByBranchId(int id) => '$branches/$id/receipt-template';

  /// Reports
  static const String reports = '/reports';
  static String reportById(int id) => '/$reports/$id';

  static const String salesPerCategory = '/$reports/sales-per-category';

  static const String salesPerShift = '/$reports/shifts';
  static String salesPerShiftById(int id) => '/$salesPerShift/$id';

  /// Purchase Order
  static const String purchaseOrders = '/purchase-orders';
  static String purchaseOrderById(int id) => '/$purchaseOrders/$id';

  /// Stock Return
  static const String stockReturns = '/stock-returns';
  static String stockReturnById(int id) => '/$stockReturns/$id';

  /// Stock Transfer
  static const String stockTransfers = '/stock-transfers';
  static String stockTransferById(int id) => '/$stockTransfers/$id';

  /// Stock Take

  /// Transactions (Sale and Returns)
  static const String transactions = '/sales';
  static String transactionById(int id) => '/$transactions/$id';

  /// Refund
  static const String refunds = '/refunds';

  /// Return Transactions (Update)
  static const String returnTransactions = '/returns';
  static String returnTransactionById(int id) => '/$returnTransactions/$id';

  /// Registers
  static const String registers = '/registers';
  static String registerById(int id) => '$registers/$id';
  static String registerBySerialNo(String serialNo) => '$registers/serial/$serialNo';

  /// Register shift
  static const String registerShift = '/shifts';

  /// Tax
  static const String tax = '/tax-codes';
  static String taxById(int id) => '$tax/$id';

  /// Receipt Templates
  static const String receiptTemplates = '/receipt-templates';
  static String receiptTemplateById(int id) => '$receiptTemplates/$id';

  /// Employee
  static const String employees = '/users';
  static String employeeById(int id) => '$employees/$id';
  static String employeeAssignedBranches(int id) => '$employees/$id/stores';
}
