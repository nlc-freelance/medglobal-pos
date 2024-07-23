import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';

class PurchaseOrderPaginatedList extends Equatable {
  final List<PurchaseOrder>? purchaseOrders;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const PurchaseOrderPaginatedList({
    this.purchaseOrders,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [purchaseOrders, currentPage, totalPages, totalCount];
}
