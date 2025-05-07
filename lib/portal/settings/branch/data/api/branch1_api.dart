import 'package:medglobal_admin_portal/core/constants/constants.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/create_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/update_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch1_dto.dart';

class Branch1Api {
  final BaseApiService _api;

  Branch1Api(this._api);

  Future<PaginatedList<Branch1Dto>> getBranches({int? page, int? size}) async {
    final response = await _api.getPaginated<Branch1Dto>(
      ApiEndpoints.branches,
      queryParams: {
        if (page != null) 'page': page,
        'size': size ?? Sizes.defaultPageSize,
      },
      fromJson: Branch1Dto.fromJson,
    );

    return PaginatedList<Branch1Dto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<Branch1Dto> getBranchById(int id) async {
    final response = await _api.get(
      ApiEndpoints.branchById(id),
      fromJson: Branch1Dto.fromJson,
    );
    return response.data;
  }

  Future<Branch1Dto> createBranch(CreateBranchDto dto) async {
    final response = await _api.post(
      ApiEndpoints.branches,
      data: dto.toJson(),
      fromJson: Branch1Dto.fromJson,
    );
    return response.data;
  }

  Future<Branch1Dto> updateBranch(UpdateBranchDto dto) async {
    final response = await _api.update(
      ApiEndpoints.branchById(dto.id),
      data: dto.toJson(),
      fromJson: Branch1Dto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteBranch(int id) async {
    return await _api.delete(ApiEndpoints.branchById(id));
  }
}
