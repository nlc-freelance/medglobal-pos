import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc(this._repository) : super(const ProductState.initial()) {
    on<_GetProductById>(_onGetProductById);
    on<_CreateProduct>(_onCreateProduct);
    on<_UpdateProduct>(_onUpdateProduct);
    on<_DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onGetProductById(event, emit) async {
    emit(const ProductState.loading());
    try {
      final result = await _repository.getProductById(event.id);

      result.fold(
        (failure) => emit(ProductState.loadFailed(failure.message)),
        (product) => emit(ProductState.loaded(product)),
      );
    } catch (e) {
      emit(ProductState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateProduct(event, emit) async {
    emit(const ProductState.processing());
    try {
      final result = await _repository.create(event.product);

      result.fold(
        (failure) => emit(ProductState.failure(failure.message)),
        (product) => emit(ProductState.success('${product.name} successfully created.')),
      );
    } catch (e) {
      emit(ProductState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(event, emit) async {
    emit(const ProductState.processing());
    try {
      final result = await _repository.update(event.id, event.product);

      result.fold(
        (failure) => emit(ProductState.failure(failure.message)),
        (product) => emit(ProductState.success('${product.name} successfully updated.')),
      );
    } catch (e) {
      emit(ProductState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(event, emit) async {
    emit(const ProductState.processing());
    try {
      final result = await _repository.delete(event.product.id);

      result.fold(
        (failure) => emit(ProductState.failure(failure.message)),
        (_) => emit(ProductState.success('${event.product.name} successfully deleted.')),
      );
    } catch (e) {
      emit(ProductState.failure(e.toString()));
    }
  }
}
