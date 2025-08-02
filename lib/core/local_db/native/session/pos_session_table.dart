import 'package:drift/drift.dart';

class PosSession extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get employeeId => integer()();
  TextColumn get employeeFirstName => text()();
  TextColumn get employeeLastName => text()();
  IntColumn get registerId => integer()();
  TextColumn get registerName => text()();
  TextColumn get registerSerialNo => text()();
  IntColumn get branchId => integer()();
  TextColumn get branchName => text()();

  // TextColumn get authToken => text().nullable()();
  // DateTimeColumn get loginTime => dateTime()();
}
