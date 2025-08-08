import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/db/database_connection.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/settings/settings_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Session,
    RegisterShifts,
    ProductCatalog,
    Transactions,
    TransactionItems,
    SyncQueue,
    SyncMetadata,
    ReceiptConfig,
    Settings,
  ],
  daos: [
    SessionDao,
    RegisterShiftDao,
    ProductCatalogDao,
    TransactionDao,
    SyncQueueDao,
    SyncMetadataDao,
    ReceiptConfigDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connect());

  @override
  int get schemaVersion => 1;
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File(path.join(dir.path, 'mgapp.sqlite'));
//     return NativeDatabase(file);
//   });
// }

// This is what `database_factory.dart` will call
// IDatabase createDatabaseImpl() => AppDatabase();
