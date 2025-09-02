import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/repositories/product_sales_history_repository.dart';

part 'product_sales_history_event.dart';
part 'product_sales_history_state.dart';
part 'product_sales_history_bloc.freezed.dart';

class ProductSalesHistoryBloc extends Bloc<ProductSalesHistoryEvent, ProductSalesHistoryState> {
  final ProductSalesHistoryRepository _repository;

  ProductSalesHistoryBloc({required ProductSalesHistoryRepository repository})
      : _repository = repository,
        super(const ProductSalesHistoryState.initial()) {
    on<_Fetch>(_onGetProductSalesHistory);
    on<_Reset>(_onReset);
  }

  Future<void> _onGetProductSalesHistory(_Fetch event, Emitter<ProductSalesHistoryState> emit) async {
    emit(const ProductSalesHistoryState.loading());

    try {
      final result = await _repository.getProductSaleHistory(event.variantId, event.query);

      result.fold(
        (failure) => emit(ProductSalesHistoryState.failure(failure.message)),
        (data) => emit(ProductSalesHistoryState.loaded(data)),
      );
    } catch (e) {
      emit(ProductSalesHistoryState.failure(e.toString()));
    }
  }

  void _onReset(_Reset event, Emitter<ProductSalesHistoryState> emit) {
    emit(const ProductSalesHistoryState.initial());
  }
}
