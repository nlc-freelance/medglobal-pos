import 'package:equatable/equatable.dart';
import 'supplier.dart';

// TODO: Change to SupplierPaginatedList
class SupplierList extends Equatable {
  final List<Supplier>? suppliers;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const SupplierList({
    this.suppliers,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [suppliers, currentPage, totalPages, totalCount];
}
