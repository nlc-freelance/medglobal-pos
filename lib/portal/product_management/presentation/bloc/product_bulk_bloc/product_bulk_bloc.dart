import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_delete_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_update_payload.dart';
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

  Future<void> _onBulkUpdateProduct(_BulkUpdateProduct event, Emitter<ProductBulkState> emit) async {
    emit(const ProductBulkState.processing());
    try {
      final ids = event.ids;
      final payload = ProductBulkUpdatePayload(productList: ids, category: event.category);

      final result = await _repository.bulkUpdateProducts(payload);

      result.fold(
        (failure) => emit(ProductBulkState.failure(failure.message)),
        (_) => emit(ProductBulkState.success('Category for all ${ids.length} product(s) successfully updated.')),
      );
    } catch (e) {
      emit(ProductBulkState.failure(e.toString()));
    }
  }

  Future<void> _onBulkDeleteProduct(_BulkDeleteProduct event, Emitter<ProductBulkState> emit) async {
    emit(const ProductBulkState.processing());
    try {
      final ids = event.ids;
      final payload = ProductBulkDeletePayload(ids: ids);

      final result = await _repository.bulkDeleteProducts(payload);

      result.fold(
        (failure) => emit(ProductBulkState.failure(failure.message)),
        (_) => emit(ProductBulkState.success('${ids.length} Product(s) successfully deleted.')),
      );
    } catch (e) {
      emit(ProductBulkState.failure(e.toString()));
    }
  }
}
