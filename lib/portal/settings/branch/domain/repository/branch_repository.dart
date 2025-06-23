import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/receipt_config.dart';

abstract class BranchRepository {
  /// Retrieves a list of all branches
  Future<Either<Failure, PaginatedList<Branch>>> getBranches({required FilterList filters});

  /// Retrieves a branch by id
  Future<Either<Failure, Branch>> getBranch(int id);

  /// Creates a new branch
  Future<Either<Failure, Branch>> createBranch(Branch branch);

  /// Updates an existing branch
  Future<Either<Failure, Branch>> updateBranch(Branch branch);

  /// Deletes a branch
  Future<Either<Failure, void>> deleteBranch(int id);

  /// Retrieves the receipt configuration for a branch by id
  Future<Either<Failure, ReceiptConfig>> getReceiptConfigByBranchId(int id);
}
