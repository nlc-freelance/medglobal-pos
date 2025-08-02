import 'package:drift/drift.dart';

@DataClassName('TransactionModel')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get receiptId => text()();
  TextColumn get type => text()();
  IntColumn get saleTransactionId => integer().nullable()();
  TextColumn get saleTransactionReceiptId => text().nullable()();
  TextColumn get status => text().nullable()();
  IntColumn get registerId => integer()();
  TextColumn get registerName => text()();
  IntColumn get branchId => integer()();
  TextColumn get branchName => text()();
  IntColumn get employeeId => integer()();
  TextColumn get employeeFirstName => text()();
  TextColumn get employeeLastName => text()();
  RealColumn get subtotal => real()();
  RealColumn get totalDiscountAmount => real().withDefault(const Constant(0.0))();
  RealColumn get tax => real().withDefault(const Constant(0.0))();
  RealColumn get total => real()();
  RealColumn get amountPaid => real()();
  TextColumn get reasonForReturn => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}
