import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item_paginated_list.dart';

abstract class RegisterItemRepository {
  Future<Either<Failure, RegisterItemPaginatedList>> getAllRegisterItems(
      {required int page, String? search, String? category});
}
