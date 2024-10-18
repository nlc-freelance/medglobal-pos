import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_dto.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_paginated_list.dart';

abstract class RegisterApi {
  Future<RegisterPaginatedList> getRegisters({required int page});
}

class RegisterApiImpl implements RegisterApi {
  final ApiService _apiService;

  RegisterApiImpl(this._apiService);

  @override
  Future<RegisterPaginatedList> getRegisters({required int page}) async {
    try {
      final response = await _apiService.collection<RegisterDto>(
        '/registers',
        queryParams: {'page': page, 'size': 10},
        converter: RegisterDto.fromJson,
      );

      return RegisterPaginatedList(
        registers: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }
}
