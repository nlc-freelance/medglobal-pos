import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/features/branches/data/branch_api.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';

class BranchRepositoryImpl implements BranchRepository {
  final BranchApi _branchApi;

  BranchRepositoryImpl(this._branchApi);

  @override
  Future<List<Branch>> getAllBranches() async {
    try {
      final response = await _branchApi.getAllBranches();
      return response.map((dto) => dto.toEntity()).toList();
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
