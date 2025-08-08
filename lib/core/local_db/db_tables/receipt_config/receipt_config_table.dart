import 'package:drift/drift.dart';

@DataClassName('ReceiptConfigModel')
class ReceiptConfig extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  BoolColumn get showBranchName => boolean()();
  BoolColumn get showBranchContact => boolean()();
  BoolColumn get showFooterMessage => boolean()();
  TextColumn get footerTitle => text().nullable()();
  TextColumn get footerMessage => text().nullable()();
  TextColumn get companyName => text().nullable()();
  TextColumn get branchName => text().nullable()();
  TextColumn get branchAddress => text().nullable()();
  TextColumn get branchPhone => text().nullable()();
  TextColumn get branchEmail => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
