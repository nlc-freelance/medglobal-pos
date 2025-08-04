import 'package:drift/drift.dart';

@DataClassName('SyncMetadataModel')
class SyncMetadata extends Table {
  TextColumn get table => text()();
  DateTimeColumn get lastSyncTime => dateTime()();

  @override
  Set<Column> get primaryKey => {table}; // one row per table
}
