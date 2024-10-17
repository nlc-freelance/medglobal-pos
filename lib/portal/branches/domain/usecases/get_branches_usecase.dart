import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/repository/branch_repository.dart';

class GetBranchesUseCase implements UseCase<BranchPaginatedList, GetBranchesParams> {
  final BranchRepository repository;

  const GetBranchesUseCase(this.repository);

  @override
  Future<Either<Failure, BranchPaginatedList>> call(GetBranchesParams params) => repository.getBranches(
        page: params.page,
      );
}

class GetBranchesParams {
  final int page;
  final String? search;

  GetBranchesParams({required this.page, this.search});
}
