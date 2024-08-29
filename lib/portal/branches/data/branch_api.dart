import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/models/api_query_params.dart';
import 'package:medglobal_admin_portal/portal/branches/data/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';

abstract class BranchApi {
  Future<List<BranchDto>> getAllBranches();
  Future<List<Branch>> getBranches();
}

class BranchApiImpl implements BranchApi {
  final ApiService _apiService;

  BranchApiImpl(this._apiService);

  @override
  Future<List<BranchDto>> getAllBranches() async {
    try {
      int currentPage = 1;
      List<BranchDto> branches = [];
      bool hasNextPage = true;

      while (hasNextPage) {
        final response = await _apiService.collection<BranchDto>(
          ApiEndpoint.branches,
          queryParams: ApiQueryParams(page: currentPage).toJson(),
          converter: BranchDto.fromJson,
        );
        if (response.items?.isNotEmpty == true) {
          branches.addAll(response.items!.toList());
          currentPage++;
        } else {
          hasNextPage = false;
        }
      }

      return branches;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Branch>> getBranches([int page = 1]) async {
    try {
      final response = await _apiService.collection<BranchDto>(
        ApiEndpoint.branches,
        queryParams: {'page': page, 'size': 10},
        converter: BranchDto.fromJson,
      );

      return response.items?.map((item) => item.toEntity()).toList() ?? <Branch>[];
    } catch (e) {
      rethrow;
    }
  }
}
