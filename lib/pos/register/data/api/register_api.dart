import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/pos/register/data/dto/register_dto.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register.dart';

abstract class RegisterApi {
  Future<List<RegisterDto>> getAllRegisters();
  Future<List<Register>> getRegisters([int page]);
}

class RegisterApiImpl implements RegisterApi {
  final ApiService _apiService;

  RegisterApiImpl(this._apiService);

  @override
  Future<List<RegisterDto>> getAllRegisters() async {
    try {
      final response = await _apiService.collection<RegisterDto>(
        '/registers',
        queryParams: {'page': 1, 'size': 10},
        converter: RegisterDto.fromJson,
      );

      return response.items!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Register>> getRegisters([int page = 1]) async {
    try {
      final response = await _apiService.collection<RegisterDto>(
        '/registers',
        queryParams: {'page': page, 'size': 10},
        converter: RegisterDto.fromJson,
      );

      return response.items?.map((item) => item.toEntity()).toList() ?? <Register>[];
    } catch (e) {
      rethrow;
    }
  }
}
