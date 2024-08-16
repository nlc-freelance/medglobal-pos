import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/register/data/api/register_item_api.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item_paginated_list.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_item_repository.dart';

class RegisterItemRepositoryImpl implements RegisterItemRepository {
  final RegisterItemApi _registerItemApi;

  RegisterItemRepositoryImpl(this._registerItemApi);

  @override
  Future<Either<Failure, RegisterItemPaginatedList>> getAllRegisterItems({
    required int page,
    String? search,
    String? category,
  }) async {
    try {
      final response = await _registerItemApi.getRegisterItems(page: page, search: search, category: category);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
