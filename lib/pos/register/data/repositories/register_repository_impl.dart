import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/pos/register/data/api/register_api.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApi _registerApi;

  RegisterRepositoryImpl(this._registerApi);

  @override
  Future<List<Register>> getAllRegisters() async {
    try {
      final response = await _registerApi.getAllRegisters();
      return response.map((dto) => dto.toEntity()).toList();
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
