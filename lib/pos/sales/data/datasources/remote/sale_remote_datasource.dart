import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

class SaleRemoteDatasource {
  final BaseApiService _api;

  SaleRemoteDatasource(this._api);

  Future<TransactionDto> createSale(OrderPayload payload) async {
    final response = await _api.post<TransactionDto>(
      ApiEndpoints.transactions,
      data: payload.toJson(),
      fromJson: TransactionDto.fromJson,
    );

    return response.data;
  }
}
