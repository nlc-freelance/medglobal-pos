import 'package:drift/drift.dart';

@DataClassName('SyncMetadataModel')
class SyncMetadata extends Table {
  TextColumn get type => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {type}; // one row per table
}
