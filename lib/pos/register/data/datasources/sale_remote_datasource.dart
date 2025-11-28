import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

class RemoteSaleDataSource {
  final ApiService _api;

  RemoteSaleDataSource({required ApiService api}) : _api = api;

  Future<TransactionDto> createSale(Map<String, dynamic> payload) async {
    // Future<TransactionDto> createSale(OrderPayload payload) async {
    final data = await _api.post<TransactionDto>(
      ApiEndpoints.transactions,
      data: payload,
      parser: (json) => parse(json, TransactionDto.fromJson),
    );

    return data;
  }
}
