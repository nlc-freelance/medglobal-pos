import 'package:drift/drift.dart';

class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get table => text()();
  TextColumn get payload => text()(); // JSON-encoded data
  TextColumn get action => text()(); // insert/update/delete
  TextColumn get status => text()(); // pending/syncing/failed
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
