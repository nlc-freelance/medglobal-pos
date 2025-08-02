import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/dto/return/update_return_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

abstract class ReturnApi {
  Future<TransactionDto> update(int id, UpdateReturnDto dto);
}

class ReturnApiImpl implements ReturnApi {
  final ApiService _apiService;

  ReturnApiImpl(this._apiService);

  @override
  Future<TransactionDto> update(int id, UpdateReturnDto dto) async {
    try {
      final response = await _apiService.update<TransactionDto>(
        '/returns/$id',
        data: dto.toJson(),
        converter: TransactionDto.fromJson,
      );
      return response!;
    } catch (e) {
      rethrow;
    }
  }
}
