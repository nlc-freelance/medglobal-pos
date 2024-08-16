import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/get_products_usecase.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductListCubit(this._getProductsUseCase) : super(ProductListInitial());

  Future<void> getProducts({int page = 1, int size = 20, String? search}) async {
    emit(ProductListLoading());

    try {
      final result = await _getProductsUseCase.call(GetProductsParams(page, size, search));
      result.fold(
        (error) => emit(ProductListError(message: error.message)),
        (data) {
          if (search != null && data.totalCount == 0 && data.products?.isEmpty == true) {
            emit(ProductListNoResultFound(message: 'No results found for \'$search\''));
          } else {
            emit(ProductListLoaded(products: data));
          }
        },
      );
    } catch (e) {
      emit(ProductListError(message: e.toString()));
    }
  }
}
