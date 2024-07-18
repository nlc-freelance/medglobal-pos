import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/entities/supply_need.dart';

abstract class SupplyNeedsRepository {
  Future<Either<Failure, List<SupplyNeed>>> getSupplyNeeds({int? branchId});
}
