import 'package:drift/drift.dart';

class Session extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get userFirstName => text()();
  TextColumn get userLastName => text()();
  TextColumn get userRole => text()();
  // IntColumn get registerId => integer()();
  // TextColumn get registerName => text()();
  // TextColumn get registerSerialNo => text()();
  // IntColumn get branchId => integer()();
  // TextColumn get branchName => text()();
  // TextColumn get receiptConfig => text()();

  // TextColumn get authToken => text().nullable()();
  // DateTimeColumn get loginTime => dateTime()();
}
