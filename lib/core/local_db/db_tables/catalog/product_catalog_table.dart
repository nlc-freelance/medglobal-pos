import 'package:drift/drift.dart';

@DataClassName('CatalogItemModel')
class ProductCatalog extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get stock => integer()();
  RealColumn get price => real()();

  @override
  Set<Column> get primaryKey => {id};
}
