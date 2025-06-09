import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/response/transaction_dto.dart';

abstract class RefundApi {
  Future<TransactionDto> createRefund(CreateRefundDto dto);
}

class RefundApiImpl implements RefundApi {
  final ApiService _apiService;

  RefundApiImpl(this._apiService);

  @override
  Future<TransactionDto> createRefund(CreateRefundDto dto) async {
    try {
      return await _apiService.post<TransactionDto>(
        '/refunds',
        data: dto.toJson(),
        converter: TransactionDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
}
