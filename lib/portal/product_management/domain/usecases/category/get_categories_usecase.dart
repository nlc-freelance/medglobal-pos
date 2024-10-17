import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';

class GetCategoriesUseCase implements UseCase<CategoryPaginatedList, GetCategoriesParams> {
  final CategoryRepository repository;

  const GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryPaginatedList>> call(GetCategoriesParams params) => repository.getCategories(
        page: params.page,
      );
}

class GetCategoriesParams {
  final int page;

  GetCategoriesParams({required this.page});
}
