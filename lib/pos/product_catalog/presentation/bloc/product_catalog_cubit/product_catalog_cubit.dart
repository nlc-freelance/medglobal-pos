import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/models/page_query.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/get_pos_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';

part 'product_catalog_state.dart';

class ProductCatalogCubit extends Cubit<ProductCatalogState> {
  final GetProductCatalogUseCase _getProductCatalogUseCase;

  ProductCatalogCubit({required GetProductCatalogUseCase getProductCatalogUseCase})
      : _getProductCatalogUseCase = getProductCatalogUseCase,
        super(ProductCatalogInitial());

  int _currentPage = 1;
  Set<CatalogItem> _products = {};

  Future<void> getProductCatalog({String? search, bool isInitialSearch = false}) async {
    if (isInitialSearch) {
      _products = {};
      _currentPage = 1;
    }

    if (_currentPage == 1) emit(ProductCatalogLoading());

    try {
      final result = await _getProductCatalogUseCase.call(PageQuery(page: _currentPage, search: search));
      result.fold(
        (error) => emit(ProductCatalogFailure(message: error.message)),
        (data) {
          _currentPage++;
          _products = {..._products, ...data.items};

          emit(ProductCatalogLoaded(
            products: _products.toList(),
            hasReachedMax: _products.length >= data.totalCount,
          ));
        },
      );
    } catch (e) {
      emit(ProductCatalogFailure(message: e.toString()));
    }
  }

  void reset() {
    _products = {};
    _currentPage = 1;
    emit(ProductCatalogInitial());
  }
}
