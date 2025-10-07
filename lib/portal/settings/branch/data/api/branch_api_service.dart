import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_payload.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

class BranchApiService {
  final ApiService _api;

  BranchApiService({required ApiService api}) : _api = api;

  Future<PaginatedList<BranchDto>> getBranches(PageQuery query) async {
    final data = await _api.getPaginated<BranchDto>(
      ApiEndpoints.branches,
      queryParams: query.toJson(),
      parser: (json) => parse(json, BranchDto.fromJson),
    );

    return PaginatedList<BranchDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<BranchDto> getBranchById(int id) async {
    final data = await _api.get(
      ApiEndpoints.branchById(id),
      parser: (json) => parse(json, BranchDto.fromJson),
    );
    return data;
  }

  Future<BranchDto> createBranch(BranchPayload payload) async {
    final data = await _api.post(
      ApiEndpoints.branches,
      data: payload.toJson(),
      parser: (json) => parse(json, BranchDto.fromJson),
    );
    return data;
  }

  Future<BranchDto> updateBranch(int id, BranchPayload payload) async {
    final data = await _api.update(
      ApiEndpoints.branchById(id),
      data: payload.toJson(),
      parser: (json) => parse(json, BranchDto.fromJson),
    );
    return data;
  }

  Future<void> deleteBranch(int id) async {
    return await _api.delete(ApiEndpoints.branchById(id));
  }

  Future<ReceiptConfiguration> getReceiptConfigurationByBranchId(int id) async {
    final data = await _api.get(
      ApiEndpoints.receiptConfigByBranchId(id),
      parser: (json) => parse(json, ReceiptConfiguration.fromJson),
    );
    return data;
  }

  Future<PaginatedList<BranchPartialDto>> getBranchesPartial(PageQuery query) async {
    final data = await _api.getPaginated<BranchPartialDto>(
      ApiEndpoints.branches,
      queryParams: query.toJson(),
      parser: (json) => parse(json, BranchPartialDto.fromJson),
    );

    return PaginatedList<BranchPartialDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }
}
