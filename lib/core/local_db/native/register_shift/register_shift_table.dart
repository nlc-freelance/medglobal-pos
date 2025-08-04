import 'package:drift/drift.dart';

@DataClassName('RegisterShiftModel')
class RegisterShifts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get registerId => integer()();
  RealColumn get openingAmount => real().nullable()();
  RealColumn get closingAmount => real().nullable()();
  TextColumn get status => text()(); // close or open
  DateTimeColumn get openedAt => dateTime().nullable()();
  DateTimeColumn get closedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}
