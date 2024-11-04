part of 'product_list_filter_cubit.dart';

class ProductListFilterState extends Equatable {
  const ProductListFilterState({this.size = 20, this.search});

  final int? size;
  final String? search;

  @override
  List<Object?> get props => [size, search];

  ProductListFilterState copyWith({
    int? size,
    String? search,
  }) {
    return ProductListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
    );
  }
}
