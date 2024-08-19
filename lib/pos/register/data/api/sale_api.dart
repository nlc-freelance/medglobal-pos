import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/dto/transaction_dto.dart';

abstract class SaleApi {
  Future<TransactionDto> createSale({required int registerId, required Order order});
}

class SaleApiImpl implements SaleApi {
  final ApiService _apiService;

  SaleApiImpl(this._apiService);

  @override
  Future<TransactionDto> createSale({required int registerId, required Order order}) async {
    try {
      return await _apiService.post<TransactionDto>(
        '/sales',
        data: order.toPayload(registerId),
        converter: TransactionDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
}
