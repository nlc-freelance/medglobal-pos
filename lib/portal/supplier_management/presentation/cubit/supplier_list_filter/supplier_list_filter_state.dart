part of 'supplier_list_filter_cubit.dart';

class SupplierListFilterState extends Equatable {
  const SupplierListFilterState({this.size = 20, this.search});

  final int? size;
  final String? search;

  @override
  List<Object?> get props => [size, search];

  SupplierListFilterState copyWith({
    int? size,
    String? search,
  }) {
    return SupplierListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
    );
  }
}
