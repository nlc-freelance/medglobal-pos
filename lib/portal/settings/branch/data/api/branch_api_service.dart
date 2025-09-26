import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_payload.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

class BranchApiService {
  final BaseApiService _api;

  BranchApiService(this._api);

  Future<PaginatedList<BranchDto>> getBranches(PageQuery query) async {
    final response = await _api.getPaginated<BranchDto>(
      ApiEndpoints.branches,
      queryParams: query.toJson(),
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

  Future<BranchDto> createBranch(BranchPayload payload) async {
    final response = await _api.post(
      ApiEndpoints.branches,
      data: payload.toJson(),
      fromJson: BranchDto.fromJson,
    );
    return response.data;
  }

  Future<BranchDto> updateBranch(int id, BranchPayload payload) async {
    final response = await _api.update(
      ApiEndpoints.branchById(id),
      data: payload.toJson(),
      fromJson: BranchDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteBranch(int id) async {
    return await _api.delete(ApiEndpoints.branchById(id));
  }

  Future<ReceiptConfiguration> getReceiptConfigurationByBranchId(int id) async {
    final response = await _api.get(
      ApiEndpoints.receiptConfigByBranchId(id),
      fromJson: ReceiptConfiguration.fromJson,
    );
    return response.data;
  }

  Future<PaginatedList<BranchPartialDto>> getBranchesPartial(PageQuery query) async {
    final response = await _api.getPaginated<BranchPartialDto>(
      ApiEndpoints.branches,
      queryParams: query.toJson(),
      fromJson: BranchPartialDto.fromJson,
    );

    return PaginatedList<BranchPartialDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }
}
