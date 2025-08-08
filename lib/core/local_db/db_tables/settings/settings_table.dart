import 'package:drift/drift.dart';

@DataClassName('SettingsModel')
class Settings extends Table {
  TextColumn get printer => text()();

  @override
  Set<Column> get primaryKey => {printer};
}
