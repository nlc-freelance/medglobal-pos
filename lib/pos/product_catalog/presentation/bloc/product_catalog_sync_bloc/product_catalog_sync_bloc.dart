import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/get_pos_products_usecase.dart';

part 'product_catalog_sync_event.dart';
part 'product_catalog_sync_state.dart';
part 'product_catalog_sync_bloc.freezed.dart';

class ProductCatalogSyncBloc extends Bloc<ProductCatalogSyncEvent, ProductCatalogSyncState> {
  final InitialFetchProductsUseCase _initialFetchProductsUseCase;

  ProductCatalogSyncBloc({required InitialFetchProductsUseCase initialFetchProductsUseCase})
      : _initialFetchProductsUseCase = initialFetchProductsUseCase,
        super(const ProductCatalogSyncState.initial()) {
    on<_InitialFetchProductCatalog>(_onInitialFetch);
  }

  Future<void> _onInitialFetch(_InitialFetchProductCatalog event, Emitter<ProductCatalogSyncState> emit) async {
    print('sjadajka');
    emit(const ProductCatalogSyncState.syncing());

    try {
      final result = await _initialFetchProductsUseCase.call();

      result.fold(
        (failure) => emit(ProductCatalogSyncState.failure(failure.message)),
        (_) => emit(ProductCatalogSyncState.synced(DateTime.now())),
      );
    } catch (e) {
      emit(ProductCatalogSyncState.failure(e.toString()));
    }
  }
}
