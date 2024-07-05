import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_product_by_id.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductByIdUseCase _getProductByIdUseCase;

  ProductCubit(this._getProductByIdUseCase) : super(ProductInitial());

  Future<void> getProductById(int id) async {
    emit(ProductByIdLoading());

    try {
      final result = await _getProductByIdUseCase.call(GetProductByIdParams(id));
      result.fold(
        (error) => emit(ProductByIdError(message: error.message)),
        (data) => emit(ProductByIdSuccess(product: data)),
      );
    } catch (e) {
      emit(ProductByIdError(message: e.toString()));
    }
  }
}
