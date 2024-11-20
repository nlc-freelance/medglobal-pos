import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/dto/transaction_dto.dart';

abstract class TransactionApi {
  Future<TransactionPaginatedList> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    int? shift,
    String? search,
    int? branch,
    bool? isAllBranches,
    String? startDate,
    String? endDate,
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
    String? search,
    int? shift,
    int? branch,
    bool? isAllBranches,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _apiService.collection<TransactionDto>(
        '/sales',
        queryParams: {
          'page': page,
          'size': size,
          if (type != null) 'type': type.name.toLowerCase(),
          if (shift != null) 'shift': shift,
          if (search != null && search != Strings.empty) 'search': search,
          if (branch != null) 'branch': branch,
          if (isAllBranches != null) 'isAllBranches': isAllBranches,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
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
