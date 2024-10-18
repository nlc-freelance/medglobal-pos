import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/sale_api.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/sale_repository.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleApi _saleApi;

  SaleRepositoryImpl(this._saleApi);

  @override
  Future<Either<Failure, Transaction>> createSale({required int registerId, required Transaction order}) async {
    try {
      final response = await _saleApi.createSale(registerId: registerId, order: order);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
