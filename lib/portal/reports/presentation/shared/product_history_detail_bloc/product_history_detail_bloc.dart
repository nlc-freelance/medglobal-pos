import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/repositories/purchase_order_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/repositories/stock_return_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/repositories/transaction_repository.dart';

part 'product_history_detail_event.dart';
part 'product_history_detail_state.dart';
part 'product_history_detail_bloc.freezed.dart';

class ProductHistoryDetailBloc<T> extends Bloc<ProductHistoryDetailEvent<T>, ProductHistoryDetailState<T>> {
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
        super(ProductHistoryDetailState<T>.initial()) {
    on<_GetDetailsById<T>>(_onGetDetails);
  }

  Future<Either<Failure, T>> _castResult(Either<Failure, dynamic> result) async {
    return result.map((res) => res as T);
  }

  Future<void> _onGetDetails(_GetDetailsById<T> event, Emitter<ProductHistoryDetailState<T>> emit) async {
    emit(ProductHistoryDetailState<T>.loading());

    try {
      final Map<ProductHistoryAction, Future<Either<Failure, T>> Function(int)> getterMap = {
        ProductHistoryAction.PURCHASE: (id) async {
          return _purchaseOrderRepository.getPurchaseOrderById(id).then(_castResult);
        },
        ProductHistoryAction.RETURN: (id) async {
          return _stockReturnRepository.getStockReturnById(id).then(_castResult);
        },
        ProductHistoryAction.TAKE: (id) async {
          return _stockTakeRepository.getStockTakeById(id).then(_castResult);
        },
        ProductHistoryAction.TRANSFER: (id) async {
          return _stockTransferRepository.getStockTransferById(id).then(_castResult);
        },
        ProductHistoryAction.SALE: (id) async {
          return _transactionRepository.getTransactionById(id).then(_castResult);
        },
      };

      final getByIdFn = getterMap[event.action];

      if (getByIdFn == null) {
        emit(ProductHistoryDetailState<T>.failure('Unsupported product action.'));
        return;
      }

      final result = await getByIdFn(event.id);
      result.fold(
        (failure) {
          emit(ProductHistoryDetailState<T>.failure(failure.message));
        },
        (data) => emit(ProductHistoryDetailState<T>.loaded(data, event.action)),
      );
    } catch (e) {
      emit(ProductHistoryDetailState<T>.failure(e.toString()));
    }
  }
}
