import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/data/api/supply_needs_api.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/repository/supply_needs_repository.dart';

class SupplyNeedsRepositoryImpl implements SupplyNeedsRepository {
  final SupplyNeedsApi _supplyNeedsApi;

  SupplyNeedsRepositoryImpl(this._supplyNeedsApi);

  @override
  Future<Either<Failure, List<SupplyNeed>>> getSupplyNeeds({int? branchId}) async {
    try {
      final response = await _supplyNeedsApi.getSupplyNeeds(branchId: branchId);
      List<SupplyNeed> allSupplyNeeds = [];
      for (var data in response) {
        allSupplyNeeds.addAll(data.items?.map((item) => item.toEntity(data.branch)).toList() ?? []);
      }
      return Right(allSupplyNeeds);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
