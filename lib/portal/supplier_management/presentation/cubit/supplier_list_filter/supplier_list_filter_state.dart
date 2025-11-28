part of 'supplier_list_filter_cubit.dart';

@freezed
class SupplierListFilterState with _$SupplierListFilterState {
  const factory SupplierListFilterState({
    @Default(1) int page,
    @Default(20) int size,
    String? search,
  }) = _SupplierListFilterState;

  factory SupplierListFilterState.initial() => const SupplierListFilterState();
}

extension SupplierListFilterStateExt on SupplierListFilterState {
  PageQuery get toPageQuery => PageQuery(
        page: page,
        size: size,
        search: search,
      );
}
