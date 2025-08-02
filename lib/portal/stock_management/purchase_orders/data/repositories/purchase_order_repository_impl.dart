import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/api/purchase_order_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/create_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/data/dto/request/update_purchase_order_item_dto.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

/// Concrete implementation of [PurchaseOrderRepository] that uses [PurchaseOrderApi] for API calls
/// and [BaseRepository] to centralize error handling.
class PurchaseOrderRepositoryImpl extends BaseRepository implements PurchaseOrderRepository {
  final PurchaseOrderApi _api;

  PurchaseOrderRepositoryImpl({required PurchaseOrderApi api}) : _api = api;

  @override
  Future<Either<Failure, PurchaseOrder>> create(NewPurchaseOrder po) {
    return call(() async {
      final requestDto = CreatePurchaseOrderDto.fromDomain(po);
      final response = await _api.createPurchaseOrder(requestDto);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, PurchaseOrder>> getPurchaseOrderById(int id) {
    return call(() async {
      final response = await _api.getPurchaseOrderById(id);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, PaginatedList<PurchaseOrder>>> getPurchaseOrders(PageQuery query
      //   {
      //   required int page,
      //   required int size,
      //   StockOrderStatus? status,
      //   int? branchId,
      //   String? startDate,
      //   String? endDate,
      // }
      ) {
    return call(() async {
      final response = await _api.getPurchaseOrders(query
          // page: page,
          // size: size,
          // status: status,
          // branchId: branchId,
          // startDate: startDate,
          // endDate: endDate,
          );
      return response.convert((po) => po.toDomain());
    });
  }

  @override
  Future<Either<Failure, PurchaseOrder>> update({
    required UpdatePurchaseOrder action,
    required int id,
    required PurchaseOrder po,
  }) {
    return call(() async {
      final requestDto = switch (action) {
        UpdatePurchaseOrder.save => UpdatePurchaseOrderDto.saveOrShip(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.save(
                      variantId: item.id!,
                      orderedQuantity: item.quantityOrdered,
                      supplierPrice: item.supplierPrice!,
                    ))
                .toList(),
            estimatedDateOfArrival: po.estimatedDateOfArrival?.toIso8601String(),
            tax: po.tax,
            discount: po.discount,
            notes: po.notes,
          ),
        UpdatePurchaseOrder.saveAndMarkAsShippedWithNewItems => UpdatePurchaseOrderDto.saveOrShip(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.saveAndMarkAsShippedWithNewItems(
                      variantId: item.id!,
                      orderedQuantity: item.quantityOrdered!,
                      supplierPrice: item.supplierPrice!,
                    ))
                .toList(),
            estimatedDateOfArrival: po.estimatedDateOfArrival?.toIso8601String(),
            tax: po.tax,
            discount: po.discount,
            notes: po.notes,
          ),
        UpdatePurchaseOrder.saveAndMarkAsShipped => UpdatePurchaseOrderDto.saveOrShip(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.saveAndMarkAsShipped(
                      id: item.id!,
                      orderedQuantity: item.quantityOrdered!,
                      supplierPrice: item.supplierPrice!,
                    ))
                .toList(),
            estimatedDateOfArrival: po.estimatedDateOfArrival?.toIso8601String(),
            tax: po.tax,
            discount: po.discount,
            notes: po.notes,
          ),
        UpdatePurchaseOrder.saveAndReceived => UpdatePurchaseOrderDto.receive(
            status: po.status!.label.toLowerCase(),
            purchaseOrderDetails: po.items
                ?.map((item) => UpdatePurchaseOrderItemDto.saveAndReceived(
                      id: item.id!,
                      receivedQuantity: item.quantityReceived!,
                    ))
                .toList(),
            notes: po.notes,
          ),
        UpdatePurchaseOrder.cancel => const UpdatePurchaseOrderDto.cancel(status: 'cancelled'),
      };

      final response = await _api.updatePurchaseOrder(
        id: id,
        dto: requestDto,
      );
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> delete(int id) {
    return call(() async => await _api.delete(id));
  }
}
