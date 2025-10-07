import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

abstract class BranchRepository {
  /// Retrieves a list of all branches
  Future<ApiResult<PaginatedList<Branch>>> getBranches(PageQuery query);

  // TODO: Refactor to have a base Branch model so we dont need to have separate repository contracts for full and partial models
  Future<ApiResult<PaginatedList<BranchPartial>>> getBranchesPartial(PageQuery query);

  /// Retrieves a branch by [id]
  Future<ApiResult<Branch>> getBranch(int id);

  /// Creates a new branch
  Future<ApiResult<Branch>> createBranch(BranchPayload payload);

  /// Updates an existing branch
  Future<ApiResult<Branch>> updateBranch(int id, BranchPayload payload);

  /// Deletes a branch by [id]
  Future<ApiResult<void>> deleteBranch(int id);

  /// Retrieves the receipt configuration for a branch by [id]
  Future<ApiResult<ReceiptConfiguration>> getReceiptConfigurationByBranchId(int id);
}
