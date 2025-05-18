import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/usecases/get_pos_products_usecase.dart';

part 'pos_product_list_state.dart';

class PosProductListCubit extends Cubit<PosProductListState> {
  final GetPOSProductsUseCase _getPOSProductsUseCase;

  PosProductListCubit(this._getPOSProductsUseCase) : super(POSProductListInitial());

  int _currentPage = 1;
  Set<POSProduct> _products = {};

  Future<void> getPOSProducts({String? search, bool isInitialSearch = false}) async {
    if (isInitialSearch) {
      _products = {};
      _currentPage = 1;
    }

    if (_currentPage == 1) emit(POSProductListLoading());

    try {
      final result = await _getPOSProductsUseCase.call(GetPOSProductsParams(page: _currentPage, search: search));
      result.fold(
        (error) => emit(POSProductListError(message: error.message)),
        (products) {
          _currentPage++;
          _products = {..._products, ...?products.data};

          emit(POSProductListLoaded(
            products: _products.toList(),
            hasReachedMax: products.currentPage == products.totalPages,
          ));
        },
      );
    } catch (e) {
      emit(POSProductListError(message: e.toString()));
    }
  }

  void reset() {
    _products = {};
    _currentPage = 1;
    emit(POSProductListInitial());
  }
}
