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

  Future<void> _onGetPurchaseOrderById(event, emit) async {
    emit(const PurchaseOrderState.loading());

    try {
      final result = await _repository.getPurchaseOrderById(event.id);
      result.fold(
        (error) => emit(PurchaseOrderState.loadFailed(error.message)),
        (po) => emit(PurchaseOrderState.loaded(po)),
      );
    } catch (e) {
      emit(PurchaseOrderState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreatePurchaseOrder(event, emit) async {
    emit(const PurchaseOrderState.creating());

    try {
      final result = await _repository.create(event.po);
      result.fold(
        (error) => emit(PurchaseOrderState.failure(error.message)),
        (po) => emit(PurchaseOrderState.created(po)),
      );
    } catch (e) {
      emit(PurchaseOrderState.failure(e.toString()));
    }
  }

  Future<void> _onUpdatePurchaseOrder(event, emit) async {
    final status = switch (event.action as UpdatePurchaseOrder) {
      UpdatePurchaseOrder.save => const PurchaseOrderState.updating(),
      UpdatePurchaseOrder.saveAndMarkAsShippedWithNewItems => const PurchaseOrderState.markingAsShippedWithNewItems(),
      UpdatePurchaseOrder.saveAndMarkAsShipped => const PurchaseOrderState.markingAsShipped(),
      UpdatePurchaseOrder.saveAndReceived => const PurchaseOrderState.markingAsReceived(),
      UpdatePurchaseOrder.cancel => const PurchaseOrderState.cancelling(),
    };

    emit(status);

    try {
      final result = await _repository.update(
        action: event.action,
        id: event.id,
        po: event.po,
      );
      result.fold(
        (error) => emit(PurchaseOrderState.failure(error.message)),
        (po) => emit(PurchaseOrderState.updated(po)),
      );
    } catch (e) {
      emit(PurchaseOrderState.failure(e.toString()));
    }
  }

  Future<void> _onDeletePurchaseOrder(event, emit) async {
    emit(const PurchaseOrderState.deleting());

    try {
      final result = await _repository.delete(event.id);
      result.fold(
        (error) => emit(PurchaseOrderState.failure(error.message)),
        (_) => emit(const PurchaseOrderState.deleted()),
      );
    } catch (e) {
      emit(PurchaseOrderState.failure(e.toString()));
    }
  }
}
