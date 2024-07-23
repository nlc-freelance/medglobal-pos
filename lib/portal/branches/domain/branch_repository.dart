import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';

abstract class BranchRepository {
  Future<List<Branch>> getAllBranches();
}
