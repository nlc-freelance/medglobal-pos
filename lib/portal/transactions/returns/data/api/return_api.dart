import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/dto/transaction_dto.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

abstract class ReturnApi {
  Future<TransactionDto> update(Transaction transaction);
}

class ReturnApiImpl implements ReturnApi {
  final ApiService _apiService;

  ReturnApiImpl(this._apiService);

  @override
  Future<TransactionDto> update(Transaction transaction) async {
    try {
      final response = await _apiService.update<TransactionDto>(
        '/returns/${transaction.id}',
        data: transaction.toReturnPayload(),
        converter: TransactionDto.fromJson,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }
}
