import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/get_products_usecase.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepository _repository;

  ProductListCubit(this._repository) : super(ProductListInitial());

  Future<void> getProducts({int page = 1, int size = 20, String? search}) async {
    emit(ProductListLoading());

    try {
      final result = await _repository.getProducts(page: page, size: size, search: search);
      result.fold(
        (error) => emit(ProductListError(message: error.message)),
        (data) {
          if (search != null && data.totalCount == 0 && data.items?.isEmpty == true) {
            emit(ProductSearchNoResult(message: 'No results found for \'$search\''));
          } else {
            emit(ProductListLoaded(data: ProductPaginatedList()));
          }
        },
      );
    } catch (e) {
      emit(ProductListError(message: e.toString()));
    }
  }
}
