import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

part 'product_bulk_event.dart';
part 'product_bulk_state.dart';
part 'product_bulk_bloc.freezed.dart';

class ProductBulkBloc extends Bloc<ProductBulkEvent, ProductBulkState> {
  final ProductRepository _repository;

  ProductBulkBloc(this._repository) : super(const ProductBulkState.initial()) {
    on<_BulkUpdateProduct>(_onBulkUpdateProduct);
    on<_BulkDeleteProduct>(_onBulkDeleteProduct);
  }

  Future<void> _onBulkUpdateProduct(event, emit) async {
    emit(const ProductBulkState.processing());
    try {
      final result = await _repository.bulkUpdate(event.ids, event.category);

      result.fold(
        (failure) => emit(ProductBulkState.failure(failure.message)),
        (_) => emit(ProductBulkState.success('${event.ids.length} Product(s) successfully deleted.')),
      );
    } catch (e) {
      emit(ProductBulkState.failure(e.toString()));
    }
  }

  Future<void> _onBulkDeleteProduct(event, emit) async {
    emit(const ProductBulkState.processing());
    try {
      final result = await _repository.bulkDelete(event.ids);

      result.fold(
        (failure) => emit(ProductBulkState.failure(failure.message)),
        (_) => emit(ProductBulkState.success('Category for all ${event.ids.length} product(s) successfully updated.')),
      );
    } catch (e) {
      emit(ProductBulkState.failure(e.toString()));
    }
  }
}
