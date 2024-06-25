import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/bulk_delete_products.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/bulk_update_products.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/create_product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/delete_product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_product_by_id.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/get_products.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/products/update_product.dart';

abstract class ProductsRepository {
  Future<List<Either<Failure, List<Product>>>> getProducts(GetProductsParams params);
  Future<List<Either<Failure, Product>>> getProductById(GetProductByIdParams params);
  Future<List<Either<Failure, void>>> create(CreateProductParams params);
  Future<List<Either<Failure, void>>> update(UpdateProductParams params);
  Future<List<Either<Failure, void>>> delete(DeleteProductParams params);
  Future<List<Either<Failure, void>>> bulkUpdate(BulkUpdateProductsParams params);
  Future<List<Either<Failure, void>>> bulkDelete(BulkDeleteProductsParams params);
}
