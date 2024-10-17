part of 'product_search_cubit.dart';

class ProductSearchState extends Equatable {
  const ProductSearchState({this.categoryId, this.search});

  final int? categoryId;
  final String? search;

  @override
  List<Object?> get props => [categoryId, search];

  ProductSearchState copyWith({
    int? categoryId,
    String? search,
  }) {
    return ProductSearchState(
      categoryId: categoryId ?? this.categoryId,
      search: search ?? this.search,
    );
  }
}
