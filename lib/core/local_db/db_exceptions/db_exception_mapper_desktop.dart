import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:medglobal_admin_portal/core/errors/exceptions.dart';

AppException mapDbException(Object e) {
  if (e is SqliteException) {
    return LocalDatabaseException('[Database error] ${e.message}');
  } else if (e is DriftWrappedException) {
    return LocalDatabaseException('Query failed: ${e.message}');
  } else if (e is InvalidDataException) {
    return LocalDatabaseException('Data mapping error: ${e.toString()}');
  } else {
    return UnexpectedException('Unexpected error: ${e.toString()}');
  }
}
