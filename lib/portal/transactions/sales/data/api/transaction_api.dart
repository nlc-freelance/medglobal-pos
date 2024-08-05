import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/data/dto/transaction_dto.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_paginated_list.dart';

abstract class TransactionApi {
  Future<TransactionPaginatedList> getTransactions({int? page, int? register, int? branch});
  Future<TransactionDto> getTransactionById(int id);
}

class TransactionApiImpl implements TransactionApi {
  final ApiService _apiService;

  TransactionApiImpl(this._apiService);

  @override
  Future<TransactionDto> getTransactionById(int id) async {
    try {
      return await _apiService.get<TransactionDto>(
        '/sales/$id',
        converter: TransactionDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TransactionPaginatedList> getTransactions({int? page, int? register, int? branch}) async {
    try {
      final response = await _apiService.collection<TransactionDto>(
        '/sales',
        queryParams: {'page': page},
        converter: TransactionDto.fromJson,
      );

      return TransactionPaginatedList(
        transactions: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }
}
