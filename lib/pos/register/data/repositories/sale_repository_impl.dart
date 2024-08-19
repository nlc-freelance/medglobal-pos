import 'package:dartz/dartz.dart' hide Order;
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/data/api/sale_api.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/sale_repository.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleApi _saleApi;

  SaleRepositoryImpl(this._saleApi);

  @override
  Future<Either<Failure, Transaction>> createSale({required int registerId, required Order order}) async {
    try {
      final response = await _saleApi.createSale(registerId: registerId, order: order);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
