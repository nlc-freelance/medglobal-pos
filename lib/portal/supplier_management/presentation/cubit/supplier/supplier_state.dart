part of 'supplier_cubit.dart';

@immutable
abstract class SupplierState extends Equatable {
  const SupplierState();

  @override
  List<Object?> get props => [];
}

class SupplierInitial extends SupplierState {}

class SupplierDetailsLoading extends SupplierState {}

class SupplierDetailsLoaded extends SupplierState {
  final Supplier supplier;
  const SupplierDetailsLoaded({required this.supplier});

  @override
  List<Object?> get props => [supplier];
}

class SupplierSaveLoading extends SupplierState {}

class SupplierDeleteLoading extends SupplierState {}

class SupplierSuccess extends SupplierState {
  final String message;
  const SupplierSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class SupplierError extends SupplierState {
  final String message;
  const SupplierError({required this.message});

  @override
  List<Object?> get props => [message];
}
