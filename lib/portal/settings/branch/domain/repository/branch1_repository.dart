import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch1.dart';

// TODO: Replace Branch1 to Branch when MVP Branch has been refactored

abstract class Branch1Repository {
  /// Retrieves a list of all branches
  Future<Either<Failure, PaginatedList<Branch1>>> getBranches({int? page, int? size});

  /// Retrieves a branch by id
  Future<Either<Failure, Branch1>> getBranch(int id);

  /// Creates a new branch
  Future<Either<Failure, Branch1>> createBranch(Branch1 tax);

  /// Updates an existing branch
  Future<Either<Failure, Branch1>> updateBranch(Branch1 tax);

  /// Deletes a branch
  Future<Either<Failure, void>> deleteBranch(int id);
}
