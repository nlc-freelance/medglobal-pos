import 'package:medglobal_admin_portal/core/extensions/extensions.dart';

enum ReportType {
  products('PRODUCT_DATA_CSV'),
  purchaseOrder('PURCHASE_ORDER_CSV'),
  stockReturn('STOCK_RETURN_CSV'),
  stockTransfer('STOCK_TRANSFER_CSV'),
  stockTake('STOCK_TAKE_CSV'),
  sales('SALES_CSV'),
  productHistory('PRODUCT_HISTORY_CSV'),
  productSalesHistory('PRODUCT_SALES_HISTORY_CSV'),
  salesPerCategory('SALES_PER_CATEGORY'),
  salesPerShift('SHIFT_REPORT_CSV'),
  supplyNeeds('SUPPLY_NEEDS_CSV'),
  productABC('ABC_ANALYSIS'),
  productPNL('PRODUCT_PNL'),
  unknown('Unknown');

  final String value;
  const ReportType(this.value);

  static ReportType fromString(String value) {
    return values.firstWhereOrNull((t) => t.value == value) ?? ReportType.unknown;
  }

  /// Report types with filter queries
  /// Report types with filter queries
  static List<ReportType> get filterable => [
        ReportType.products,
        ReportType.purchaseOrder,
        ReportType.stockReturn,
        ReportType.stockTake,
        ReportType.stockTransfer,
        ReportType.sales,
        ReportType.productHistory,
        ReportType.salesPerCategory,
        ReportType.salesPerShift,
        ReportType.supplyNeeds,
      ];

  /// Report types with payload for export
  bool get withPayload => [
        productABC,
        productPNL,
        productSalesHistory,
      ].contains(this);

  /// Report types with data payload and list of generated
  bool get hasListAndRequiresSourceData => [productABC, productPNL].contains(this);

  /// Product performance reports
  bool get isProductPerformance => [productABC, productPNL].contains(this);

  /// Product performance reports filter by type
  static Map<String, dynamic> get productPerformanceTypeQuery => {
        'type': [ReportType.productPNL.value, ReportType.productABC.value].join(',')
      };
}

enum ReportStatus {
  pending('Processing'),
  completed('Completed'),
  failed('Failed'),
  unknown('Unknown');

  final String label;
  const ReportStatus(this.label);

  static ReportStatus fromString(String value) {
    return values.firstWhereOrNull((t) => t.name == value) ?? ReportStatus.unknown;
  }
}

enum ProductHistoryAction {
  PURCHASE('Purchase'),
  RETURN('Return'),
  TAKE('TAKE'),
  TRANSFER('Transfer'),
  SALE('Sale'),
  REFUND('Refund'),
  INITIAL('Initial');

  final String label;
  const ProductHistoryAction(this.label);
}

enum SalesPerCategoryGroupBy {
  BRANCH('Branch'),
  TIME_VARIANCE('Time Variance');

  final String label;
  const SalesPerCategoryGroupBy(this.label);
}

enum TimeVariance {
  DAILY('Daily'),
  WEEKLY('Weekly'),
  MONTHLY('Monthly'),
  HOUR_OF_DAY('Hour of Day'),
  DAY_OF_WEEK('Day of Week');

  final String label;
  const TimeVariance(this.label);
}

enum FilterType {
  BRANCH('Branch'),
  SUPPLIER('Supplier'),
  PRODUCT_CATEGORY('Product Category'),
  PRODUCT_NAME('Product Name');

  final String label;
  const FilterType(this.label);
}

enum FilterRule {
  IS('is'),
  NOT('is not');

  final String label;
  const FilterRule(this.label);
}

enum LogicalOperator {
  AND('and'),
  OR('or');

  final String label;
  const LogicalOperator(this.label);
}

enum ProductPerformanceType {
  abc('ABC Analysis',
      'An analysis report that ranks products into A, B, and C groups based on importance to support business prioritization.'),
  pnl('Profit & Loss', 'A financial report that shows the profitability of top products over a specified period.');

  const ProductPerformanceType(this.title, this.description);
  final String title;
  final String description;

  ReportType get toReportType => switch (this) {
        ProductPerformanceType.abc => ReportType.productABC,
        ProductPerformanceType.pnl => ReportType.productPNL,
      };
}

enum RankingCriteria {
  volume,
  revenue,
}

enum Period {
  custom('Custom Date'),
  monthly('Monthly'),
  quarterly('Quarterly'),
  half('Half-Year'),
  annual('Annual');

  const Period(this.label);
  final String label;
}

enum Quarter {
  q1('Q1 (Jan-Mar)'),
  q2('Q2 (Apr-Jun)'),
  q3('Q3 (Jul-Sep)'),
  q4('Q4 (Oct-Dec)');

  const Quarter(this.label);
  final String label;
}

enum HalfYear {
  first('First Half (Jan-Jun)'),
  second('Second Half (Jul-Dec)');

  const HalfYear(this.label);
  final String label;
}
