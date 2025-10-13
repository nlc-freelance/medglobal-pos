import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/repositories/stock_return_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';

part 'product_history_detail_event.dart';
part 'product_history_detail_state.dart';
part 'product_history_detail_bloc.freezed.dart';

class ProductHistoryDetailBloc extends Bloc<ProductHistoryDetailEvent, ProductHistoryDetailState> {
  final PurchaseOrderRepository _purchaseOrderRepository;
  final StockReturnRepository _stockReturnRepository;
  final StockTakeRepository _stockTakeRepository;
  final StockTransferRepository _stockTransferRepository;
  final TransactionRepository _transactionRepository;

  ProductHistoryDetailBloc({
    required PurchaseOrderRepository purchaseOrderRepository,
    required StockReturnRepository stockReturnRepository,
    required StockTakeRepository stockTakeRepository,
    required StockTransferRepository stockTransferRepository,
    required TransactionRepository transactionRepository,
  })  : _purchaseOrderRepository = purchaseOrderRepository,
        _stockReturnRepository = stockReturnRepository,
        _stockTakeRepository = stockTakeRepository,
        _stockTransferRepository = stockTransferRepository,
        _transactionRepository = transactionRepository,
        super(const ProductHistoryDetailState.initial()) {
    on<_GoToDetailsPage>(_onGetDetails);
  }

  // Future<ApiResult<dynamic>> _castResult(ApiResult<dynamic> result) async => result;

  Future<void> _onGetDetails(_GoToDetailsPage event, Emitter<ProductHistoryDetailState> emit) async {
    emit(const ProductHistoryDetailState.loading());

    try {
      final Map<ProductHistoryAction, String> routeMap = {
        ProductHistoryAction.PURCHASE: 'purchaseOrderDetails',
        ProductHistoryAction.RETURN: 'stockReturnDetails',
        ProductHistoryAction.TAKE: 'stockTakeDetails',
        ProductHistoryAction.TRANSFER: 'stockTransferDetails',
        ProductHistoryAction.SALE: 'saleTransactionDetails',
        ProductHistoryAction.REFUND: 'returnTransactionDetails',
      };

      final route = routeMap[event.action];

      if (route == null) {
        emit(const ProductHistoryDetailState.failure('Unsupported product action.'));
        return;
      }

      return emit(ProductHistoryDetailState.success(routeName: route, id: event.id));

      // final result =  route(event.id);
      // result.map(
      //   success: (data) => emit(ProductHistoryDetailState.loaded(data, event.action)),
      //   failure: (failure) => emit(ProductHistoryDetailState.failure(failure.failure.message)),
      // );
    } catch (e) {
      emit(ProductHistoryDetailState.failure(e.toString()));
    }
  }
}
