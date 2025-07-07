part of 'supplier_list_cubit.dart';

@immutable
abstract class SupplierListState extends Equatable {
  const SupplierListState();

  @override
  List<Object?> get props => [];
}

class SupplierListInitial extends SupplierListState {
  const SupplierListInitial();

  @override
  List<Object?> get props => [];
}

class SupplierListLoading extends SupplierListState {
  const SupplierListLoading();

  @override
  List<Object?> get props => [];
}

final class SupplierSearchNoResult extends SupplierListState {
  final String message;
  const SupplierSearchNoResult({required this.message});

  @override
  List<Object> get props => [message];
}

class SupplierListLoaded extends SupplierListState {
  final PaginatedList<Supplier> data;
  const SupplierListLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class SupplierListError extends SupplierListState {
  final String message;
  const SupplierListError({required this.message});

  @override
  List<Object?> get props => [message];
}
