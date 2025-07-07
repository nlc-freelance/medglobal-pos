import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/create_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/update_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/receipt_config.dart';

class BranchApi {
  final BaseApiService _api;

  BranchApi(this._api);

  Future<PaginatedList<BranchDto>> getBranches({required PageQuery filters}) async {
    final response = await _api.getPaginated<BranchDto>(
      ApiEndpoints.branches,
      queryParams: filters.toJson(),
      fromJson: BranchDto.fromJson,
    );

    return PaginatedList<BranchDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<BranchDto> getBranchById(int id) async {
    final response = await _api.get(
      ApiEndpoints.branchById(id),
      fromJson: BranchDto.fromJson,
    );
    return response.data;
  }

  Future<BranchDto> createBranch(CreateBranchDto dto) async {
    final response = await _api.post(
      ApiEndpoints.branches,
      data: dto.toJson(),
      fromJson: BranchDto.fromJson,
    );
    return response.data;
  }

  Future<BranchDto> updateBranch(UpdateBranchDto dto) async {
    final response = await _api.update(
      ApiEndpoints.branchById(dto.id),
      data: dto.toJson(),
      fromJson: BranchDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteBranch(int id) async {
    return await _api.delete(ApiEndpoints.branchById(id));
  }

  Future<ReceiptConfig> getReceiptConfigByBranchId(int id) async {
    final response = await _api.get(
      ApiEndpoints.receiptConfigByBranchId(id),
      fromJson: ReceiptConfig.fromJson,
    );
    return response.data;
  }
}
