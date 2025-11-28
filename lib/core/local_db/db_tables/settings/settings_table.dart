import 'package:drift/drift.dart';

@DataClassName('SettingsModel')
class Settings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();

  // Register
  IntColumn get registerId => integer().nullable()();
  TextColumn get registerName => text().nullable()();
  TextColumn get registerSerialNo => text().nullable()();

  // Branch
  IntColumn get branchId => integer().nullable()();
  TextColumn get branchName => text().nullable()();

  // Receipt Config
  TextColumn get receiptConfig => text().nullable()();

  // Printer
  TextColumn get printer => text().nullable()();

  @override
  Set<Column> get primaryKey => {id}; // only one row
}
