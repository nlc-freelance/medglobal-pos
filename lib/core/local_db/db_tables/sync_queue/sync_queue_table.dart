import 'package:drift/drift.dart';

class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemId => integer()();
  IntColumn get userId => integer()();
  TextColumn get table => text()();
  TextColumn get data => text()(); // JSON-encoded data or the full payload
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
// As of now, only WRITE operation is supported
// TextColumn get operation => text()(); // insert/update/delete
}
