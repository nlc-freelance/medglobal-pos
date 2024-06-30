import 'package:equatable/equatable.dart';
import 'category.dart';

class CategoryList extends Equatable {
  final List<Category>? categories;
  final int? currentPage;
  final int? totalPages;

  const CategoryList({
    this.categories,
    this.currentPage,
    this.totalPages,
  });
  @override
  List<Object?> get props => [categories, currentPage, totalPages];
}
