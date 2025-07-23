import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register/register_dto.dart';

part 'sales_per_shift_details_dto.g.dart';

@JsonSerializable()
class SalesPerShiftDetailsDto extends Equatable {
  @DateTimeConverter()
  final DateTime? openTime;
  @DateTimeConverter()
  final DateTime? closeTime;
  final String? branch;
  final RegisterDto? register;
  final String? openedBy;
  final String? closedBy;
  @JsonKey(name: 'totalSalesCount')
  final int? totalSaleTransactions;
  @JsonKey(name: 'totalReturnsCount')
  final int? totalReturnTransactions;
  @JsonKey(name: 'totalDiscountedTransactionsCount')
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

  const SalesPerShiftDetailsDto({
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

  SalesPerShiftDetails toEntity() => SalesPerShiftDetails(
        openTime: openTime,
        closeTime: closeTime,
        branch: branch,
        register: register?.id,
        openedBy: openedBy,
        closedBy: closedBy,
        totalSaleTransactions: totalSaleTransactions,
        totalReturnTransactions: totalReturnTransactions,
        totalDiscountedTransactions: totalDiscountedTransactions,
        totalGrossSalesAmount: totalGrossSalesAmount,
        totalSalesAmount: totalSalesAmount,
        totalReturnsAmount: totalReturnsAmount,
        totalDiscountedAmount: totalDiscountedAmount,
        netSales: netSales,
        netSalesCash: netSalesCash,
        openingCash: openingCash,
        closingCash: closingCash,
        actualCash: actualCash,
        excessCash: excessCash,
      );

  factory SalesPerShiftDetailsDto.fromJson(Map<String, dynamic> json) => _$SalesPerShiftDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPerShiftDetailsDtoToJson(this);
}
