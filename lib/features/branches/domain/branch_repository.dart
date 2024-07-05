import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';

abstract class BranchRepository {
  Future<List<Branch>> getAllBranches();
}
