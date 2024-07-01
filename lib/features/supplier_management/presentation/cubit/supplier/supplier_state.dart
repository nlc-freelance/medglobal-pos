part of 'supplier_cubit.dart';

@immutable
abstract class SupplierState extends Equatable {
  const SupplierState();

  @override
  List<Object?> get props => [];
}

class SupplierInitialState extends SupplierState {
  const SupplierInitialState();

  @override
  List<Object?> get props => [];
}

/// LOADING
///
class GetSupplierLoadingState extends SupplierState {
  const GetSupplierLoadingState();
}

class SaveSupplierLoadingState extends SupplierState {
  const SaveSupplierLoadingState();

  @override
  List<Object?> get props => [];
}

class DeleteSupplierLoadingState extends SupplierState {
  const DeleteSupplierLoadingState();

  @override
  List<Object?> get props => [];
}

/// SUCCESS ACTION
///
class GetSupplierState extends SupplierState {
  final Supplier supplier;
  const GetSupplierState({required this.supplier});

  @override
  List<Object?> get props => [supplier];
}

class SupplierSuccessState extends SupplierState {
  final String message;
  const SupplierSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

/// ERROR
///
class SupplierErrorState extends SupplierState {
  final String message;
  const SupplierErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
