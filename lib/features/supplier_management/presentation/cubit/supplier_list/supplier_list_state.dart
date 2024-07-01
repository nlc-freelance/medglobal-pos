part of 'supplier_list_cubit.dart';

@immutable
abstract class SupplierListState extends Equatable {
  const SupplierListState();

  @override
  List<Object?> get props => [];
}

class SupplierListInitialState extends SupplierListState {
  const SupplierListInitialState();

  @override
  List<Object?> get props => [];
}

class SupplierListLoadingState extends SupplierListState {
  const SupplierListLoadingState();

  @override
  List<Object?> get props => [];
}

class GetSupplierListState extends SupplierListState {
  final List<Supplier> suppliers;
  const GetSupplierListState({required this.suppliers});

  @override
  List<Object?> get props => [suppliers];
}

class SupplierListErrorState extends SupplierListState {
  final String message;
  const SupplierListErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
