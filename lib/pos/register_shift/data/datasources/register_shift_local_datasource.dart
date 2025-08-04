import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/native/register_shift/register_shift_dao.dart';

class RegisterShiftLocalDataSource {
  final RegisterShiftDao _dao;

  RegisterShiftLocalDataSource({required RegisterShiftDao dao}) : _dao = dao;

  Future<RegisterShiftModel> openShift(RegisterShiftsCompanion data) async {
    final id = await _dao.insertShift(data);
    return getShiftById(id);
  }

  Future<RegisterShiftModel> getShiftById(int id) async {
    return await _dao.getShiftById(id);
  }

  Future<RegisterShiftModel> closeShift(int id, double amount) async {
    await _dao.updateShift(id, amount);
    return await _dao.getShiftById(id);
  }
}
