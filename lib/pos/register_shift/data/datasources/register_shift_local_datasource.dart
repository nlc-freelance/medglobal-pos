import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';

class RegisterShiftLocalDataSource {
  final RegisterShiftDao _dao;

  RegisterShiftLocalDataSource({required RegisterShiftDao dao}) : _dao = dao;

  Future<RegisterShiftModel?> getOpenShift(int registerId) async {
    return await _dao.getOpenShift(registerId);
  }

  Future<RegisterShiftModel> openShift(RegisterShift data) async {
    final id = await _dao.createShift(data.toRegisterShiftCompanion);
    return await getShiftById(id);
  }

  Future<RegisterShiftModel> closeShift(int id, double amount) async {
    await _dao.closeShift(id, amount);
    return await _dao.getShiftById(id);
  }

  Future<RegisterShiftModel?> getLastClosedShift(int registerId) async {
    return await _dao.getLastClosedShift(registerId);
  }

  Future<RegisterShiftModel> getShiftById(int id) async {
    return await _dao.getShiftById(id);
  }
}
