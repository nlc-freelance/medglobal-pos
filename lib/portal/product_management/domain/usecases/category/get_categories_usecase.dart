import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';

class GetCategoriesUseCase implements UseCase<PaginatedList<Category>, GetCategoriesParams> {
  final CategoryRepository repository;

  const GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, PaginatedList<Category>>> call(GetCategoriesParams params) => repository.getCategories(
        filters: PageQuery(page: params.page),
      );
}

class GetCategoriesParams {
  final int page;

  GetCategoriesParams({required this.page});
}
