import 'package:drift/drift.dart';

@DataClassName('CatalogItemModel')
class PosCatalog extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get stock => integer()();
  RealColumn get price => real()();
}
