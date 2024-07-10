import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/create_product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/delete_product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_product_by_id.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/update_product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductByIdUseCase _getProductByIdUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final CreateProductUseCase _createProductUseCase;

  ProductCubit(
    this._getProductByIdUseCase,
    this._deleteProductUseCase,
    this._updateProductUseCase,
    this._createProductUseCase,
  ) : super(ProductInitial());

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

  Future<void> create(Product product) async {
    emit(ProductLoading());

    try {
      final result = await _createProductUseCase.call(CreateProductParams(product));
      result.fold(
        (error) => emit(ProductError(message: error.message)),
        (_) => emit(const ProductSuccess(message: 'Product successfully created.')),
      );
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> update(int id, Product product) async {
    emit(ProductLoading());

    try {
      final result = await _updateProductUseCase.call(UpdateProductParams(id, product: product));
      result.fold(
        (error) => emit(ProductError(message: error.message)),
        (_) => emit(const ProductSuccess(message: 'Product successfully updated.')),
      );
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> delete(int id) async {
    emit(ProductLoading());

    try {
      final result = await _deleteProductUseCase.call(DeleteProductParams(id));
      result.fold(
        (error) => emit(ProductError(message: error.message)),
        (_) => emit(const ProductSuccess(message: 'Product successfully deleted.')),
      );
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
