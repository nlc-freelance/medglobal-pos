import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';

class CategoryPaginatedList extends Equatable {
  final List<Category>? categories;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const CategoryPaginatedList({
    this.categories,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [categories, currentPage, totalPages, totalCount];
}
