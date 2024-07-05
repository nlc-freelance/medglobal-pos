import 'package:equatable/equatable.dart';
import 'supplier.dart';

class SupplierPaginatedList extends Equatable {
  final List<Supplier>? suppliers;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const SupplierPaginatedList({
    this.suppliers,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [suppliers, currentPage, totalPages, totalCount];
}
