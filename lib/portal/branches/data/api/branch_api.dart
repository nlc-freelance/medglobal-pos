import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/branches/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch_paginated_list.dart';

abstract class BranchApi {
  Future<BranchPaginatedList> getBranches({required int page});
}

class BranchApiImpl implements BranchApi {
  final ApiService _apiService;

  BranchApiImpl(this._apiService);

  @override
  Future<BranchPaginatedList> getBranches({required int page}) async {
    try {
      final response = await _apiService.collection<BranchDto>(
        ApiEndpoint.branches,
        queryParams: {'page': page, 'size': 10},
        converter: BranchDto.fromJson,
      );

      return BranchPaginatedList(
        branches: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }
}
