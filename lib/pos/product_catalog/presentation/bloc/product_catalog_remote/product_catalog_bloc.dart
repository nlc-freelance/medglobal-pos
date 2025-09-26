import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/delta_sync_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/initial_fetch_products_usecase.dart';

part 'product_catalog_event.dart';
part 'product_catalog_remote_state.dart';
part 'product_catalog_sync_bloc.freezed.dart';

class ProductCatalogBloc extends Bloc<ProductCatalogEvent, ProductCatalogRemoteState> {
  final InitialFetchProductsUseCase _initialFetchProductsUseCase;
  final DeltaSyncProductsUseCase _deltaSyncProductsUseCase;

  ProductCatalogBloc({
    required InitialFetchProductsUseCase initialFetchProductsUseCase,
    required DeltaSyncProductsUseCase deltaSyncProductsUseCase,
  })  : _initialFetchProductsUseCase = initialFetchProductsUseCase,
        _deltaSyncProductsUseCase = deltaSyncProductsUseCase,
        super(const ProductCatalogRemoteState.initial()) {
    on<_InitialFetchProductCatalog>(_onInitialFetch);
    on<_DeltaSyncProductCatalog>(_onDeltaSync);
  }

  Future<void> _onInitialFetch(_InitialFetchProductCatalog event, Emitter<ProductCatalogRemoteState> emit) async {
    emit(const ProductCatalogRemoteState.syncing());

    try {
      final lastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('posCatalog');
      if (lastSyncedAt == null) {
        final result = await _initialFetchProductsUseCase.call();

        result.fold(
          (failure) => emit(ProductCatalogRemoteState.failure(failure.message)),
          (_) => emit(ProductCatalogRemoteState.synced(DateTime.now())),
        );
      } else {
        final result = await _deltaSyncProductsUseCase.call(lastSyncedAt);

        result.fold(
          (failure) => emit(ProductCatalogRemoteState.failure(failure.message)),
          (_) => emit(ProductCatalogRemoteState.synced(DateTime.now())),
        );
      }

      // final result = await _initialFetchProductsUseCase.call();
      //
      // result.fold(
      //   (failure) => emit(ProductCatalogRemoteState.failure(failure.message)),
      //   (_) => emit(ProductCatalogRemoteState.synced(DateTime.now())),
      // );
    } catch (e) {
      emit(ProductCatalogRemoteState.failure(e.toString()));
    }
  }

  Future<void> _onDeltaSync(_DeltaSyncProductCatalog event, Emitter<ProductCatalogRemoteState> emit) async {
    emit(const ProductCatalogRemoteState.syncing());

    try {
      // final result = await _deltaSyncProductsUseCase.call();
      //
      // result.fold(
      //   (failure) => emit(ProductCatalogRemoteState.failure(failure.message)),
      //   (_) => emit(ProductCatalogRemoteState.synced(DateTime.now())),
      // );
    } catch (e) {
      emit(ProductCatalogRemoteState.failure(e.toString()));
    }
  }
}
