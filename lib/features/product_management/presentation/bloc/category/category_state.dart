part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

sealed class CategoryActionState extends CategoryState {
  const CategoryActionState();

  @override
  List<Object> get props => [];
}

/// Category List
///
final class CategoryListInitial extends CategoryState {
  const CategoryListInitial();
}

final class CategoryListLoading extends CategoryState {
  const CategoryListLoading();
}

final class CategoryListLoaded extends CategoryState {
  final List<Category> categories;

  const CategoryListLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CategoryListError extends CategoryState {
  final String message;

  const CategoryListError({required this.message});

  @override
  List<Object> get props => [message];
}

/// Category
///
final class CategoryInitial extends CategoryActionState {
  const CategoryInitial();
}

final class CategoryActionLoading extends CategoryActionState {
  const CategoryActionLoading();
}

final class CategoryActionSuccess extends CategoryActionState {
  final Category category;

  const CategoryActionSuccess({required this.category});

  @override
  List<Object> get props => [category];
}

final class CategoryActionError extends CategoryActionState {
  final String message;

  const CategoryActionError({required this.message});

  @override
  List<Object> get props => [message];
}
