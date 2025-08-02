import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

abstract class SaleApi {
  Future<TransactionDto> createSale(SalePayload dto);
}

class SaleApiImpl implements SaleApi {
  final ApiService _apiService;

  SaleApiImpl(this._apiService);

  @override
  Future<TransactionDto> createSale(SalePayload dto) async {
    try {
      return await _apiService.post<TransactionDto>(
        '/sales',
        data: dto.toJson(),
        converter: TransactionDto.fromJson,
      );
    } catch (e) {
      rethrow;
    }
  }
}
