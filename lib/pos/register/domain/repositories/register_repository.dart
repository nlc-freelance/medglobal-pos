import 'package:medglobal_admin_portal/pos/register/domain/entities/register.dart';

abstract class RegisterRepository {
  Future<List<Register>> getAllRegisters();
}
