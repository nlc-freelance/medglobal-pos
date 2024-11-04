import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/get_purchase_orders_usecase.dart';

part 'purchase_order_list_remote_state.dart';

class PurchaseOrderListRemoteCubit extends Cubit<PurchaseOrderListRemoteState> {
  final GetPurchaseOrdersUseCase _getPurchaseOrdersUseCase;

  PurchaseOrderListRemoteCubit(this._getPurchaseOrdersUseCase) : super(PurchaseOrderListInitial());

  Future<void> getPurchaseOrders({
    int page = 1,
    int size = 20,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    emit(PurchaseOrderListLoading());

    try {
      final result = await _getPurchaseOrdersUseCase.call(GetPurchaseOrdersParams(
        page: page,
        size: size,
        status: status,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      ));
      result.fold(
        (error) => emit(PurchaseOrderListError(message: error.message)),
        (data) => emit(PurchaseOrderListLoaded(data: data)),
      );
    } catch (e) {
      emit(PurchaseOrderListError(message: e.toString()));
    }
  }
}
