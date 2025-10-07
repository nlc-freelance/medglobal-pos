import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/register/data/datasources/sale_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class RemoteSaleRepositoryImpl extends BaseRepository implements RemoteSaleRepository {
  final RemoteSaleDataSource _remoteDataSource;

  RemoteSaleRepositoryImpl({required RemoteSaleDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<ApiResult<Transaction>> createSale(Map<String, dynamic> payload) {
    // Future<Either<Failure, Transaction>> createSale(OrderPayload payload) {
    return call(() async {
      // final payload = OrderPayload.fromDomain(registerId, order);
      final transactionDto = await _remoteDataSource.createSale(payload);
      return transactionDto.toDomain();
    });
  }
}
