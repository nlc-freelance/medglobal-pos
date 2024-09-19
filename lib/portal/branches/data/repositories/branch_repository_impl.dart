import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/data/api/branch_api.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/repository/branch_repository.dart';

class BranchRepositoryImpl implements BranchRepository {
  final BranchApi _branchApi;

  BranchRepositoryImpl(this._branchApi);

  @override
  Future<Either<Failure, BranchPaginatedList>> getBranches({required int page}) async {
    try {
      final response = await _branchApi.getBranches(page: page);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
