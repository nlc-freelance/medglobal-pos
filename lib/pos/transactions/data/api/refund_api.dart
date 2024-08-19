import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/shared/dto/transaction_dto.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';

abstract class RefundApi {
  Future<TransactionDto> create(Transaction transaction);
}

class RefundApiImpl implements RefundApi {
  final ApiService _apiService;

  RefundApiImpl(this._apiService);

  @override
  Future<TransactionDto> create(Transaction transaction) async {
    try {
      return await _apiService.post<TransactionDto>(
        '/refunds',
        data: transaction.toRefundPayload(),
        converter: TransactionDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
}
