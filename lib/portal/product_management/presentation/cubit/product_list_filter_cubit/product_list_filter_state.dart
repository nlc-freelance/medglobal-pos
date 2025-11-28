part of 'product_list_filter_cubit.dart';

@freezed
class ProductListFilterState with _$ProductListFilterState {
  const factory ProductListFilterState({
    @Default(1) int page,
    @Default(20) int size,
    String? search,
  }) = _ProductListFilterState;

  factory ProductListFilterState.initial() => const ProductListFilterState();
}

extension ProductListFilterStateExt on ProductListFilterState {
  PageQuery get toPageQuery => PageQuery(
        page: page,
        size: size,
        search: search,
      );

  Map<String, dynamic> get filters => {
        'search': search,
      };
}
