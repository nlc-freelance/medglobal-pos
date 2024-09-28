part of 'supplier_list_filter_cubit.dart';

class SupplierListFilterState extends Equatable {
  const SupplierListFilterState({this.size = 20});

  final int? size;

  @override
  List<Object?> get props => [size];

  SupplierListFilterState copyWith({
    int? size,
  }) {
    return SupplierListFilterState(
      size: size ?? this.size,
    );
  }
}
