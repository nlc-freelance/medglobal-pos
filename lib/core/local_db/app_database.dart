import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/native/catalog/pos_catalog_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/catalog/pos_catalog_table.dart';
import 'package:medglobal_admin_portal/core/local_db/db/database_connection.dart';
import 'package:medglobal_admin_portal/core/local_db/native/register_shift/register_shift_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/register_shift/register_shift_table.dart';
import 'package:medglobal_admin_portal/core/local_db/native/transactions/transaction_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/transactions/transaction_item_table.dart';
import 'package:medglobal_admin_portal/core/local_db/native/transactions/transaction_table.dart';
import 'package:medglobal_admin_portal/core/local_db/native/session/session_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/session/session_table.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_metadata_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_metadata_table.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_queue_dao.dart';
import 'package:medglobal_admin_portal/core/local_db/native/sync_queue/sync_queue_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Session, RegisterShifts, PosCatalog, Transactions, TransactionItems, SyncQueue, SyncMetadata],
  daos: [SessionDao, RegisterShiftDao, PosCatalogDao, TransactionDao, SyncQueueDao, SyncMetadataDao],
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
