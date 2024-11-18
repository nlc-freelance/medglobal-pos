import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/domain/entities/sales_per_shift.dart';

class SalesPerShiftPaginatedList extends Equatable {
  final List<SalesPerShift>? salesPerShift;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const SalesPerShiftPaginatedList({
    this.salesPerShift,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });

  @override
  List<Object?> get props => [salesPerShift, currentPage, totalPages, totalCount];
}
