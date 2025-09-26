import 'package:medglobal_admin_portal/core/network/new/api/api_endpoints.dart';
import 'package:medglobal_admin_portal/core/network/new/api/base_api_service.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

class RemoteRefundDataSource {
  final BaseApiService _api;

  RemoteRefundDataSource(this._api);

  Future<TransactionDto> createRefund(CreateRefundDto dto) async {
    final response = await _api.post<TransactionDto>(
      ApiEndpoints.refunds,
      data: dto.toJson(),
      fromJson: TransactionDto.fromJson,
    );
    return response.data;
  }
}
