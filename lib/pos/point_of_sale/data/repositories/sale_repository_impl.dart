import 'package:dartz/dartz.dart' hide Order;
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/sale_api.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_dto.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleApi _saleApi;

  SaleRepositoryImpl(this._saleApi);

  @override
  Future<Either<Failure, Transaction>> createSale({required int registerId, required Order order}) async {
    try {
      final requestDto = SalePayload.fromDomain(registerId, order);
      final response = await _saleApi.createSale(requestDto);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
