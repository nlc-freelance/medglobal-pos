import 'package:dartz/dartz.dart';
import '../../../../../core/core.dart';
import '../../entities/category_list.dart';
import '../../repositories/category_repository.dart';

class GetCategoriesUseCase implements UseCase<CategoryList, GetCategoriesParams> {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryList>> call(GetCategoriesParams params) => repository.getCategories(params.page);
}

class GetCategoriesParams {
  final int page;

  GetCategoriesParams(this.page);
}
