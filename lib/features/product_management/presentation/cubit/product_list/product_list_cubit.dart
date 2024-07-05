import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_products_usecase.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductListCubit(this._getProductsUseCase) : super(ProductListInitial());

  Future<void> getProducts() async {
    emit(ProductListLoading());

    try {
      final result = await _getProductsUseCase.call(GetProductsParams(1));
      result.fold(
        (error) => emit(ProductListError(message: error.message)),
        (data) => emit(ProductListLoaded(products: data.products!)),
      );
    } catch (e) {
      emit(ProductListError(message: e.toString()));
    }
  }
}
