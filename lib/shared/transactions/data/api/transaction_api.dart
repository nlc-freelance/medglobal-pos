import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/dto/transaction_dto.dart';

abstract class TransactionApi {
  Future<TransactionPaginatedList> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    int? register,
    int? branch,
  });
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
  Future<TransactionPaginatedList> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    int? register,
    int? branch,
  }) async {
    try {
      final response = await _apiService.collection<TransactionDto>(
        '/sales',
        queryParams: {'page': page, 'size': size, 'type': type?.name.toLowerCase()},
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
