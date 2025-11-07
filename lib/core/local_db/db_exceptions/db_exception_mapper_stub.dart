import 'package:medglobal_admin_portal/core/errors/exceptions.dart';

AppException mapDbException(Object e) {
  return UnexpectedException('Unexpected DB error: ${e.toString()}');
}
