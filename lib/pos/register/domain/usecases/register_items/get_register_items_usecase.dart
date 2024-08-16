import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item_paginated_list.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_item_repository.dart';

class GetRegisterItemsUseCase implements UseCase<RegisterItemPaginatedList, GetRegisterItemsParams> {
  final RegisterItemRepository _repository;

  GetRegisterItemsUseCase(this._repository);

  @override
  Future<Either<Failure, RegisterItemPaginatedList>> call(GetRegisterItemsParams params) =>
      _repository.getAllRegisterItems(
        page: params.page,
        search: params.search,
        category: params.category,
      );
}

class GetRegisterItemsParams {
  final int page;
  final String? search;
  final String? category;

  GetRegisterItemsParams({required this.page, this.search, this.category});
}
