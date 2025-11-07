import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/core/models/query_params.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_result.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/repositories/auth_repository.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';

abstract class LazyListFetcher<T> {
  Future<ApiResult<PaginatedList<T>>> call(PageQuery query);
}

class BranchListFetcher implements LazyListFetcher<Branch> {
  final BranchRepository branchRepo;
  final EmployeeRepository employeeRepo;
  final AuthRepository authRepo;

  BranchListFetcher(this.branchRepo, this.employeeRepo, this.authRepo);

  @override
  Future<ApiResult<PaginatedList<Branch>>> call(PageQuery query) async {
    final result = await authRepo.getAuthSession();

    return result.when(
      success: (data) {
        final user = data.user;
        if (user == null) return Future.value(ApiResult.failure(UserNotFoundFailure('Unauthorized. User not found.')));

        if (user.type == UserType.admin) {
          return branchRepo.getBranches(query);
        } else if (user.type == UserType.supervisor) {
          return employeeRepo.getEmployeeAssignedBranches(user.id!, query);
        } else {
          return Future.value(ApiResult.failure(UnexpectedFailure('Unauthorized')));
        }
      },
      failure: (failure) => Future.value(ApiResult.failure(UserNotFoundFailure(failure.message))),
    );
  }
}
