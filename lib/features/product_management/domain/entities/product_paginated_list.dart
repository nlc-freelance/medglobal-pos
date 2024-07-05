import 'package:equatable/equatable.dart';
import 'product/product.dart';

class ProductPaginatedList extends Equatable {
  final List<Product>? products;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const ProductPaginatedList({
    this.products,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [products, currentPage, totalPages, totalCount];
}
