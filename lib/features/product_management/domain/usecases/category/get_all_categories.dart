import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import '../../repositories/category_repository.dart';

class GetAllCategoriesUseCase {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<List<Category>> call() => repository.getAllCategories();
}
