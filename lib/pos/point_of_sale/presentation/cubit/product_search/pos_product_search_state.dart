part of 'pos_product_search_cubit.dart';

class PosProductSearchState extends Equatable {
  const PosProductSearchState({this.categoryId, this.search});

  final int? categoryId;
  final String? search;

  @override
  List<Object?> get props => [categoryId, search];

  PosProductSearchState copyWith({
    int? categoryId,
    String? search,
  }) {
    return PosProductSearchState(
      categoryId: categoryId ?? this.categoryId,
      search: search ?? this.search,
    );
  }
}
