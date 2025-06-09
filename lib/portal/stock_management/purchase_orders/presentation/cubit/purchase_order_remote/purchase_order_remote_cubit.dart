// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:medglobal_admin_portal/core/enums/enums.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/create_purchase_order_usecase.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/delete_purchase_order_usecase.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/get_purchase_order_by_id_usecase.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/usecases/update_purchase_order_usecase.dart';

// part 'purchase_order_remote_state.dart';

// class PurchaseOrderRemoteCubit extends Cubit<PurchaseOrderRemoteState> {
//   final GetPurchaseOrderByIdUseCase _getPurchaseOrderByIdUsecase;
//   final CreatePurchaseOrderUseCase _createPurchaseOrderUsecase;
//   final UpdatePurchaseOrderUseCase _updatePurchaseOrderUsecase;
//   final DeletePurchaseOrderUseCase _deletePurchaseOrderUseCase;

//   PurchaseOrderRemoteCubit(
//     this._getPurchaseOrderByIdUsecase,
//     this._createPurchaseOrderUsecase,
//     this._updatePurchaseOrderUsecase,
//     this._deletePurchaseOrderUseCase,
//   ) : super(PurchaseOrderInitial());

//   void reset() => emit(PurchaseOrderInitial());

//   Future<void> getPurchaseOrderById(int id) async {
//     emit(PurchaseOrderByIdLoading());

//     try {
//       final result = await _getPurchaseOrderByIdUsecase.call(GetPurchaseOrderByIdParams(id));
//       result.fold(
//         (error) => emit(PurchaseOrderByIdError(message: error.message)),
//         (data) => emit(PurchaseOrderByIdSuccess(purchaseOrder: data)),
//       );
//     } catch (e) {
//       emit(PurchaseOrderByIdError(message: e.toString()));
//     }
//   }

//   Future<void> create(NewPurchaseOrder payload) async {
//     emit(PurchaseOrderCreateLoading());

//     try {
//       final result = await _createPurchaseOrderUsecase.call(CreatePurchaseOrderParams(payload));
//       result.fold(
//         (error) => emit(PurchaseOrderError(message: error.message)),
//         (data) => emit(PurchaseOrderCreateSuccess(purchaseOrder: data)),
//       );
//     } catch (e) {
//       emit(PurchaseOrderError(message: e.toString()));
//     }
//   }

//   Future<void> update(StockOrderUpdate type, {required int id, required PurchaseOrder purchaseOrder}) async {
//     if (type == StockOrderUpdate.SAVE) emit(PurchaseOrderSaveLoading());
//     if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED ||
//         type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
//       emit(PurchaseOrderSaveAndMarkAsShippedLoading());
//     }
//     if (type == StockOrderUpdate.SAVE_AND_RECEIVED) emit(PurchaseOrderSaveAndReceivedLoading());
//     if (type == StockOrderUpdate.CANCEL) emit(PurchaseOrderCancelLoading());

//     try {
//       final result =
//           await _updatePurchaseOrderUsecase.call(UpdatePurchaseOrderParams(type, id: id, purchaseOrder: purchaseOrder));
//       result.fold(
//         (error) => emit(PurchaseOrderError(message: error.message)),
//         (data) => emit(PurchaseOrderSuccess(purchaseOrder: data)),
//       );
//     } catch (e) {
//       emit(PurchaseOrderError(message: e.toString()));
//     }
//   }

//   Future<void> delete(int id) async {
//     emit(PurchaseOrderDeleteLoading());

//     try {
//       final result = await _deletePurchaseOrderUseCase.call(DeletePurchaseOrderParams(id));
//       result.fold(
//         (error) => emit(PurchaseOrderError(message: error.message)),
//         (_) => emit(PurchaseOrderDeleteSuccess()),
//       );
//     } catch (e) {
//       emit(PurchaseOrderError(message: e.toString()));
//     }
//   }
// }
