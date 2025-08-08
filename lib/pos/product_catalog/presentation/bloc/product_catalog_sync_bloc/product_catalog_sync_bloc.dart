import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/delta_sync_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/get_product_catalog_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/initial_fetch_products_usecase.dart';

part 'product_catalog_sync_event.dart';
part 'product_catalog_sync_state.dart';
part 'product_catalog_sync_bloc.freezed.dart';

class ProductCatalogSyncBloc extends Bloc<ProductCatalogSyncEvent, ProductCatalogSyncState> {
  final InitialFetchProductsUseCase _initialFetchProductsUseCase;
  final DeltaSyncProductsUseCase _deltaSyncProductsUseCase;

  ProductCatalogSyncBloc({
    required InitialFetchProductsUseCase initialFetchProductsUseCase,
    required DeltaSyncProductsUseCase deltaSyncProductsUseCase,
  })  : _initialFetchProductsUseCase = initialFetchProductsUseCase,
        _deltaSyncProductsUseCase = deltaSyncProductsUseCase,
        super(const ProductCatalogSyncState.initial()) {
    on<_InitialFetchProductCatalog>(_onInitialFetch);
    on<_DeltaSyncProductCatalog>(_onDeltaSync);
  }

  Future<void> _onInitialFetch(_InitialFetchProductCatalog event, Emitter<ProductCatalogSyncState> emit) async {
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

  Future<void> _onDeltaSync(_DeltaSyncProductCatalog event, Emitter<ProductCatalogSyncState> emit) async {
    emit(const ProductCatalogSyncState.syncing());

    try {
      final result = await _deltaSyncProductsUseCase.call();

      result.fold(
        (failure) => emit(ProductCatalogSyncState.failure(failure.message)),
        (_) => emit(ProductCatalogSyncState.synced(DateTime.now())),
      );
    } catch (e) {
      emit(ProductCatalogSyncState.failure(e.toString()));
    }
  }
}
