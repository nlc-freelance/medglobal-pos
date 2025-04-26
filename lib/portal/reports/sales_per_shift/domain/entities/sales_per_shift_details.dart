import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'sales_per_shift_details.g.dart';

@JsonSerializable()
class SalesPerShiftDetails extends Equatable {
  @DateTimeConverter()
  final DateTime? openTime;
  @DateTimeConverter()
  final DateTime? closeTime;
  final String? branch;
  final int? register;
  final String? openedBy;
  final String? closedBy;
  final int? totalSaleTransactions;
  final int? totalReturnTransactions;
  final int? totalDiscountedTransactions;
  final double? totalGrossSalesAmount;
  final double? totalSalesAmount;
  final double? totalReturnsAmount;
  final double? totalDiscountedAmount;
  final double? netSales;
  final double? netSalesCash;
  final double? openingCash;
  final double? closingCash;
  final double? actualCash;
  final double? excessCash;

  const SalesPerShiftDetails({
    this.openTime,
    this.closeTime,
    this.branch,
    this.register,
    this.openedBy,
    this.closedBy,
    this.totalSaleTransactions,
    this.totalReturnTransactions,
    this.totalDiscountedTransactions,
    this.totalGrossSalesAmount,
    this.totalSalesAmount,
    this.totalReturnsAmount,
    this.totalDiscountedAmount,
    this.netSales,
    this.netSalesCash,
    this.openingCash,
    this.closingCash,
    this.actualCash,
    this.excessCash,
  });

  @override
  List<Object?> get props => [
        openTime,
        closeTime,
        branch,
        register,
        openedBy,
        closedBy,
        totalSaleTransactions,
        totalReturnTransactions,
        totalDiscountedTransactions,
        totalGrossSalesAmount,
        totalSalesAmount,
        totalReturnsAmount,
        totalDiscountedAmount,
        netSales,
        netSalesCash,
        openingCash,
        closingCash,
        actualCash,
        excessCash,
      ];

  factory SalesPerShiftDetails.fromJson(Map<String, dynamic> json) => _$SalesPerShiftDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPerShiftDetailsToJson(this);

  List<ShiftDetailSummary> get salesSummary => [
        ShiftDetailSummary(type: 'Cash Gross Sales', count: totalSaleTransactions, amount: totalGrossSalesAmount!),
        ShiftDetailSummary(type: 'Cash Net Sales', count: totalSaleTransactions, amount: totalSalesAmount!),
        ShiftDetailSummary(type: 'Cash Discounts', count: totalDiscountedTransactions, amount: totalDiscountedAmount!),
        ShiftDetailSummary(type: 'Cash Refunds', count: totalReturnTransactions, amount: totalReturnsAmount!),

        /// Total -> netSales
      ];

  List<ShiftDetailSummary> get cashDrawerSummary => [
        ShiftDetailSummary(type: 'Opening Cash', amount: openingCash!),
        ShiftDetailSummary(type: 'Net Sales Cash', amount: netSalesCash!),
      ];
}

class ShiftDetailSummary {
  final String type;
  final int? count;
  final double amount;

  ShiftDetailSummary({required this.type, this.count, required this.amount});
}
