import 'package:medglobal_admin_portal/core/network/new/api/base_api_service.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

abstract class RefundApi {
  Future<TransactionDto> createRefund(CreateRefundDto dto);
}

class RefundApiImpl implements RefundApi {
  final BaseApiService _apiService;

  RefundApiImpl(this._apiService);

  @override
  Future<TransactionDto> createRefund(CreateRefundDto dto) async {
    final response = await _apiService.post<TransactionDto>(
      '/refunds',
      data: dto.toJson(),
      fromJson: TransactionDto.fromJson,
    );
    return response.data;
  }
}
