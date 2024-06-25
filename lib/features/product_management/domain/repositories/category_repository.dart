import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, void>> add(Category params);
}
