import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift.dart';

part 'sales_per_shift_dto.g.dart';

@JsonSerializable()
class SalesPerShiftDto extends Equatable {
  final int? id;
  @JsonKey(name: 'openShift')
  @DateTimeConverter()
  final DateTime? openTime;
  @JsonKey(name: 'closeShift')
  @DateTimeConverter()
  final DateTime? closeTime;
  final String? branch;
  final String? register;
  @JsonKey(name: 'totalSales')
  final int? totalSaleTransactions;
  final double? totalSalesAmount;

  const SalesPerShiftDto({
    this.id,
    this.openTime,
    this.closeTime,
    this.branch,
    this.register,
    this.totalSaleTransactions,
    this.totalSalesAmount,
  });

  @override
  List<Object?> get props => [openTime, closeTime, branch, register, totalSaleTransactions, totalSalesAmount];

  SalesPerShift toEntity() => SalesPerShift(
        id: id,
        openTime: openTime,
        closeTime: closeTime,
        branch: branch,
        register: register,
        totalSaleTransactions: totalSaleTransactions,
        totalSalesAmount: totalSalesAmount,
      );

  factory SalesPerShiftDto.fromJson(Map<String, dynamic> json) => _$SalesPerShiftDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPerShiftDtoToJson(this);
}
