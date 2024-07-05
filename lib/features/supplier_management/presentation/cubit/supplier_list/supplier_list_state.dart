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

class SupplierListLoaded extends SupplierListState {
  final List<Supplier> suppliers;
  const SupplierListLoaded({required this.suppliers});

  @override
  List<Object?> get props => [suppliers];
}

class SupplierListError extends SupplierListState {
  final String message;
  const SupplierListError({required this.message});

  @override
  List<Object?> get props => [message];
}
