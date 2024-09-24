import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product.dart';

class POSProductPaginatedList extends Equatable {
  final List<POSProduct>? data;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const POSProductPaginatedList({
    this.data,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });

  @override
  List<Object?> get props => [data, currentPage, totalPages, totalCount];
}
