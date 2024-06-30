part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

final class GetCategories extends CategoryEvent {
  final bool isLoadMore;
  const GetCategories({this.isLoadMore = false});
}

final class AddCategory extends CategoryEvent {
  final String name;
  const AddCategory(this.name);

  @override
  List<Object?> get props => [name];
}
