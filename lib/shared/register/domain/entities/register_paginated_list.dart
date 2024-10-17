import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register.dart';

class RegisterPaginatedList extends Equatable {
  final List<Register>? registers;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const RegisterPaginatedList({
    this.registers,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [registers, currentPage, totalPages, totalCount];
}
