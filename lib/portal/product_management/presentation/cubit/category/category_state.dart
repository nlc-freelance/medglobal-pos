part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final Category category;
  const CategorySuccess({required this.category});

  @override
  List<Object> get props => [category];
}

final class CategoryError extends CategoryState {
  final String message;
  const CategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
