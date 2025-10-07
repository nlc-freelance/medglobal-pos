import 'package:medglobal_admin_portal/core/network/new/api/api_endpoints.dart';
import 'package:medglobal_admin_portal/core/network/new/api/base_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

class RemoteRefundDataSource {
  final ApiService _api;

  RemoteRefundDataSource({required ApiService api}) : _api = api;

  Future<TransactionDto> createRefund(CreateRefundDto dto) async {
    final data = await _api.post<TransactionDto>(
      ApiEndpoints.refunds,
      data: dto.toJson(),
      parser: (json) => parse(json, TransactionDto.fromJson),
    );

    return data;
  }
}
