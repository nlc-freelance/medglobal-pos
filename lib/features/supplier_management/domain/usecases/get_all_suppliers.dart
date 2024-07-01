import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';

class GetAllSuppliersUseCase {
  final SupplierRepository repository;

  GetAllSuppliersUseCase(this.repository);

  Future<List<Supplier>> call() => repository.getAllSuppliers();
}
