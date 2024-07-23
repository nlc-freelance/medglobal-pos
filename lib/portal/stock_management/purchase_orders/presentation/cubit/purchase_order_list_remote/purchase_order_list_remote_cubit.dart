import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/get_purchase_orders_usecase.dart';

part 'purchase_order_list_remote_state.dart';

class PurchaseOrderListRemoteCubit extends Cubit<PurchaseOrderListRemoteState> {
  final GetPurchaseOrdersUseCase _getPurchaseOrdersUsecase;

  PurchaseOrderListRemoteCubit(this._getPurchaseOrdersUsecase) : super(PurchaseOrderListInitial());

  Future<void> getPurchaseOrders({int? page, StockOrderStatus? status}) async {
    emit(PurchaseOrderListLoading());

    try {
      final result = await _getPurchaseOrdersUsecase.call(GetPurchaseOrdersParams(page: page, status: status));
      result.fold(
        (error) => emit(PurchaseOrderListError(message: error.message)),
        (data) => emit(PurchaseOrderListLoaded(purchaseOrders: data.purchaseOrders!)),
      );
    } catch (e) {
      emit(PurchaseOrderListError(message: e.toString()));
    }
  }
}
