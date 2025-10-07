import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';

class TransactionApi {
  final ApiService _api;

  TransactionApi({required ApiService api}) : _api = api;

  Future<TransactionDto> getTransactionById(int id) async {
    final data = await _api.get(
      '/sales/$id',
      parser: (json) => parse(json, TransactionDto.fromJson),
    );

    return data;
  }

  Future<PaginatedList<TransactionDto>> getTransactions({
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
    final data = await _api.getPaginated<TransactionDto>(
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
      parser: (json) => parse(json, TransactionDto.fromJson),
    );

    return PaginatedList<TransactionDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }
}
