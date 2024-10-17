import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch_paginated_list.dart';

abstract class BranchRepository {
  Future<Either<Failure, BranchPaginatedList>> getBranches({required int page});
}
