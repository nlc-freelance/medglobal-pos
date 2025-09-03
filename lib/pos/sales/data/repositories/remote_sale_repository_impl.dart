import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/data/datasources/sale_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class RemoteSaleRepositoryImpl extends BaseRepository implements RemoteSaleRepository {
  final RemoteSaleDataSource _remoteDataSource;

  RemoteSaleRepositoryImpl({required RemoteSaleDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Transaction>> createSale(Map<String, dynamic> payload) {
    // Future<Either<Failure, Transaction>> createSale(OrderPayload payload) {
    return call(() async {
      // final payload = OrderPayload.fromDomain(registerId, order);
      final transactionDto = await _remoteDataSource.createSale(payload);
      return transactionDto.toDomain();
    });
  }
}
