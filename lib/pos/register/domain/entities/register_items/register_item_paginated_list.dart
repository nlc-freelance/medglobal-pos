import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item.dart';

class RegisterItemPaginatedList extends Equatable {
  final List<RegisterItem>? data;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const RegisterItemPaginatedList({
    this.data,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });

  @override
  List<Object?> get props => [data, currentPage, totalPages, totalCount];
}
