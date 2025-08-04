import 'package:drift/drift.dart';

/// Stub implementation of [connect] for the web platform where no database is needed.
DatabaseConnection connect() {
  print('✅ CONNECT CALLED in WEB');
  throw UnsupportedError('Database is not supported on the web platform.');
}
