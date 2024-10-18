import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';

class BranchPaginatedList extends Equatable {
  final List<Branch>? branches;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const BranchPaginatedList({
    this.branches,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [branches, currentPage, totalPages, totalCount];
}
