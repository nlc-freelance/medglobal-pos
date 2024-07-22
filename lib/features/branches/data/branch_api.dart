import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/models/api_query_params.dart';
import 'package:medglobal_admin_portal/features/branches/data/branch_dto.dart';

abstract class BranchApi {
  Future<List<BranchDto>> getAllBranches();
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

      print('AAA ${branches}');

      return branches;
    } catch (_) {
      rethrow;
    }
  }
}
