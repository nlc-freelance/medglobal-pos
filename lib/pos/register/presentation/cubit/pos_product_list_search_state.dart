part of 'pos_product_list_search_cubit.dart';

class PosProductListSearchState extends Equatable {
  const PosProductListSearchState({this.categoryId, this.search});

  final int? categoryId;
  final String? search;

  @override
  List<Object?> get props => [categoryId, search];

  PosProductListSearchState copyWith({
    int? categoryId,
    String? search,
  }) {
    return PosProductListSearchState(
      categoryId: categoryId ?? this.categoryId,
      search: search ?? this.search,
    );
  }
}
