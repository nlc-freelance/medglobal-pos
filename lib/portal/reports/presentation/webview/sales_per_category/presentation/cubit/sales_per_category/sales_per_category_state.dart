part of 'sales_per_category_cubit.dart';

sealed class SalesPerCategoryState extends Equatable {
  const SalesPerCategoryState();

  @override
  List<Object?> get props => [];
}

class SalesPerCategoryInitial extends SalesPerCategoryState {}

class SalesPerCategoryLoading extends SalesPerCategoryState {}

class SalesPerCategoryLoaded extends SalesPerCategoryState {
  final List<SalesPerCategory> data;
  const SalesPerCategoryLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class SalesPerCategoryError extends SalesPerCategoryState {
  final String message;
  const SalesPerCategoryError({required this.message});

  @override
  List<Object?> get props => [message];
}
