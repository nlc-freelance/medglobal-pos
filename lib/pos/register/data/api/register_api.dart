import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/models/api_query_params.dart';
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
      print('registers fetch');
      int currentPage = 1;
      List<RegisterDto> registers = [];
      bool hasNextPage = true;

      while (hasNextPage) {
        final response = await _apiService.collection<RegisterDto>(
          '/registers',
          queryParams: ApiQueryParams(page: currentPage).toJson(),
          converter: RegisterDto.fromJson,
        );
        if (response.items?.isNotEmpty == true) {
          registers.addAll(response.items!.toList());
          currentPage++;
        } else {
          hasNextPage = false;
        }
      }

      return registers;
    } catch (e) {
      rethrow;
    }
  }
}
