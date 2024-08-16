part of 'product_list_search_cubit.dart';

class ProductListSearchState extends Equatable {
  const ProductListSearchState({this.size = 20, this.search});

  final int? size;
  final String? search;

  @override
  List<Object?> get props => [size, search];

  ProductListSearchState copyWith({
    int? size,
    String? search,
  }) {
    return ProductListSearchState(
      size: size ?? this.size,
      search: search ?? this.search,
    );
  }
}
