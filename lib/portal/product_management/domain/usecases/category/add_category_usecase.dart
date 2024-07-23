import 'package:dartz/dartz.dart';
import '../../../../../core/core.dart';
import '../../entities/category.dart';
import '../../repositories/category_repository.dart';

class AddCategoryUseCase implements UseCase<Category, AddCategoryParams> {
  final CategoryRepository repository;

  AddCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, Category>> call(AddCategoryParams params) => repository.addCategory(params.name);
}

class AddCategoryParams {
  final String name;

  AddCategoryParams(this.name);
}
