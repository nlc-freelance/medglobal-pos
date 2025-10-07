import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/enums/purchase_order_enum.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';

part 'purchase_order_event.dart';
part 'purchase_order_state.dart';
part 'purchase_order_bloc.freezed.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  final PurchaseOrderRepository _repository;

  PurchaseOrderBloc(this._repository) : super(const PurchaseOrderState.initial()) {
    on<_GetPurchaseOrderById>(_onGetPurchaseOrderById);
    on<_CreatePurchaseOrder>(_onCreatePurchaseOrder);
    on<_UpdatePurchaseOrder>(_onUpdatePurchaseOrder);
    on<_DeletePurchaseOrder>(_onDeletePurchaseOrder);
  }

  Future<void> _onGetPurchaseOrderById(_GetPurchaseOrderById event, Emitter<PurchaseOrderState> emit) async {
    emit(const PurchaseOrderState.loading());

    try {
      final result = await _repository.getPurchaseOrderById(event.id);
      result.when(
        success: (po) => emit(PurchaseOrderState.loaded(po)),
        failure: (error) => emit(PurchaseOrderState.loadFailed(error.message)),
      );
    } catch (e) {
      emit(PurchaseOrderState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreatePurchaseOrder(_CreatePurchaseOrder event, Emitter<PurchaseOrderState> emit) async {
    if (event.po.branchId == null || event.po.branchId == null) {
      return emit(
        const PurchaseOrderState.failure('Please select both branch and supplier before creating the purchase order.'),
      );
    }

    emit(const PurchaseOrderState.creating());

    try {
      final result = await _repository.create(event.po);
      result.when(
        success: (po) => emit(PurchaseOrderState.created(po)),
        failure: (error) => emit(PurchaseOrderState.failure(error.message)),
      );
    } catch (e) {
      emit(PurchaseOrderState.failure(e.toString()));
    }
  }

  Future<void> _onUpdatePurchaseOrder(_UpdatePurchaseOrder event, Emitter<PurchaseOrderState> emit) async {
    switch (event.action) {
      case UpdatePurchaseOrder.save:
        emit(const PurchaseOrderState.updating());
        break;
      case UpdatePurchaseOrder.saveAndMarkAsShippedWithNewItems:
        if (event.po.items?.any((item) => item.quantityOrdered == null) == true) {
          return emit(const PurchaseOrderState.failure(
            'Please add order quantities for all items before shipping the purchase order.',
          ));
        } else if (event.po.items?.any((item) => item.supplierPrice == null) == true) {
          return emit(const PurchaseOrderState.failure(
            'Please add supplier price for all items before shipping the purchase order.',
          ));
        } else {
          emit(const PurchaseOrderState.markingAsShippedWithNewItems());
        }
        break;
      case UpdatePurchaseOrder.saveAndMarkAsShipped:
        if (event.po.items?.isEmpty == true) {
          return emit(const PurchaseOrderState.failure(
            'Please add items to order before shipping.',
          ));
        }
        if (event.po.items?.any((item) => item.quantityOrdered == null) == true) {
          return emit(const PurchaseOrderState.failure(
            'Please add order quantities for all items before shipping the purchase order.',
          ));
        } else if (event.po.items?.any((item) => item.supplierPrice == null) == true) {
          return emit(const PurchaseOrderState.failure(
            'Please add supplier price for all items before shipping the purchase order.',
          ));
        } else {
          emit(const PurchaseOrderState.markingAsShipped());
        }
        break;
      case UpdatePurchaseOrder.saveAndReceived:
        emit(const PurchaseOrderState.markingAsReceived());
        break;
      case UpdatePurchaseOrder.cancel:
        emit(const PurchaseOrderState.cancelling());
        break;
    }

    try {
      final result = await _repository.update(
        action: event.action,
        id: event.id,
        po: event.po,
      );
      result.when(
        success: (po) => emit(PurchaseOrderState.updated(po)),
        failure: (error) => emit(PurchaseOrderState.failure(error.message)),
      );
    } catch (e) {
      emit(PurchaseOrderState.failure(e.toString()));
    }
  }

  Future<void> _onDeletePurchaseOrder(_DeletePurchaseOrder event, Emitter<PurchaseOrderState> emit) async {
    emit(const PurchaseOrderState.deleting());

    try {
      final result = await _repository.delete(event.id);
      result.when(
        success: (_) => emit(const PurchaseOrderState.deleted()),
        failure: (error) => emit(PurchaseOrderState.failure(error.message)),
      );
    } catch (e) {
      emit(PurchaseOrderState.failure(e.toString()));
    }
  }
}
