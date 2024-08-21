import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/pos/register/data/dto/register_dto.dart';

abstract class RegisterApi {
  Future<List<RegisterDto>> getAllRegisters();
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
}
