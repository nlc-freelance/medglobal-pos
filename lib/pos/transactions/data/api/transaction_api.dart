import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/response/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class TransactionApi {
  final BaseApiService _api;

  TransactionApi(this._api);

  Future<TransactionDto> getTransactionById(int id) async {
    final response = await _api.get(
      '/sales/$id',
      fromJson: TransactionDto.fromJson,
    );
    return response.data;
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
    final response = await _api.getPaginated<TransactionDto>(
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
      fromJson: TransactionDto.fromJson,
    );

    return PaginatedList<TransactionDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
    // final response = await _apiService.collection<TransactionDto>(
    //   '/sales',
    //   queryParams: {
    //     'page': page,
    //     'size': size,
    //     if (type != null) 'type': type.name.toLowerCase(),
    //     if (shift != null) 'shift': shift,
    //     if (search != null && search != Strings.empty) 'search': search,
    //     if (branch != null) 'branch': branch,
    //     if (isAllBranches != null) 'isAllBranches': isAllBranches,
    //     if (startDate != null) 'startDate': startDate,
    //     if (endDate != null) 'endDate': endDate,
    //   },
    //   converter: TransactionDto.fromJson,
    // );

    // return TransactionPaginatedList(
    //   transactions: response.items?.map((item) => item.toDomain()).toList(),
    //   currentPage: response.pageInfo?.page,
    //   totalPages: response.pageInfo?.totalPages,
    //   totalCount: response.pageInfo?.totalCount,
    // );
  }
}
