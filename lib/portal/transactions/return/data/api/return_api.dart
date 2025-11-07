import 'package:medglobal_admin_portal/core/network/old_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/dto/return/update_return_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

class ReturnApi {
  final ApiService _api;

  ReturnApi({required ApiService api}) : _api = api;

  Future<TransactionDto> update(int id, UpdateReturnDto dto) async {
    final data = await _api.update<TransactionDto>(
      '/returns/$id',
      data: dto.toJson(),
      parser: (json) => parse(json, TransactionDto.fromJson),
    );
    return data;
  }
}
