import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_catalog_filter_state.dart';
part 'product_catalog_filter_cubit.freezed.dart';

class ProductCatalogFilterCubit extends Cubit<ProductCatalogFilterState> {
  ProductCatalogFilterCubit() : super(ProductCatalogFilterState.initial());

  void setSearch(String search) => emit(state.copyWith(search: search));
}
