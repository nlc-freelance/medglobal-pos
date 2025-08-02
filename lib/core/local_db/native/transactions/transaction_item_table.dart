import 'package:drift/drift.dart';

@DataClassName('TransactionItemModel')
class TransactionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().customConstraint('REFERENCES transactions(id)')();
  IntColumn get itemId => integer()();
  TextColumn get itemName => text()();
  IntColumn get quantity => integer()();
  RealColumn get price => real()();
  TextColumn get discountType => text().nullable()();
  RealColumn get discountValue => real().nullable()();
  RealColumn get discountAmount => real().nullable()();
  RealColumn get totalDiscountAmount => real().nullable()();
  RealColumn get subtotal => real()();
  RealColumn get total => real()();
}
