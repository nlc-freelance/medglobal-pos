// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SessionTable extends Session with TableInfo<$SessionTable, SessionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userFirstNameMeta =
      const VerificationMeta('userFirstName');
  @override
  late final GeneratedColumn<String> userFirstName = GeneratedColumn<String>(
      'user_first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userLastNameMeta =
      const VerificationMeta('userLastName');
  @override
  late final GeneratedColumn<String> userLastName = GeneratedColumn<String>(
      'user_last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userRoleMeta =
      const VerificationMeta('userRole');
  @override
  late final GeneratedColumn<String> userRole = GeneratedColumn<String>(
      'user_role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, userFirstName, userLastName, userRole];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session';
  @override
  VerificationContext validateIntegrity(Insertable<SessionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_first_name')) {
      context.handle(
          _userFirstNameMeta,
          userFirstName.isAcceptableOrUnknown(
              data['user_first_name']!, _userFirstNameMeta));
    } else if (isInserting) {
      context.missing(_userFirstNameMeta);
    }
    if (data.containsKey('user_last_name')) {
      context.handle(
          _userLastNameMeta,
          userLastName.isAcceptableOrUnknown(
              data['user_last_name']!, _userLastNameMeta));
    } else if (isInserting) {
      context.missing(_userLastNameMeta);
    }
    if (data.containsKey('user_role')) {
      context.handle(_userRoleMeta,
          userRole.isAcceptableOrUnknown(data['user_role']!, _userRoleMeta));
    } else if (isInserting) {
      context.missing(_userRoleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      userFirstName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_first_name'])!,
      userLastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_last_name'])!,
      userRole: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_role'])!,
    );
  }

  @override
  $SessionTable createAlias(String alias) {
    return $SessionTable(attachedDatabase, alias);
  }
}

class SessionData extends DataClass implements Insertable<SessionData> {
  final int id;
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String userRole;
  const SessionData(
      {required this.id,
      required this.userId,
      required this.userFirstName,
      required this.userLastName,
      required this.userRole});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['user_first_name'] = Variable<String>(userFirstName);
    map['user_last_name'] = Variable<String>(userLastName);
    map['user_role'] = Variable<String>(userRole);
    return map;
  }

  SessionCompanion toCompanion(bool nullToAbsent) {
    return SessionCompanion(
      id: Value(id),
      userId: Value(userId),
      userFirstName: Value(userFirstName),
      userLastName: Value(userLastName),
      userRole: Value(userRole),
    );
  }

  factory SessionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      userFirstName: serializer.fromJson<String>(json['userFirstName']),
      userLastName: serializer.fromJson<String>(json['userLastName']),
      userRole: serializer.fromJson<String>(json['userRole']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'userFirstName': serializer.toJson<String>(userFirstName),
      'userLastName': serializer.toJson<String>(userLastName),
      'userRole': serializer.toJson<String>(userRole),
    };
  }

  SessionData copyWith(
          {int? id,
          int? userId,
          String? userFirstName,
          String? userLastName,
          String? userRole}) =>
      SessionData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        userFirstName: userFirstName ?? this.userFirstName,
        userLastName: userLastName ?? this.userLastName,
        userRole: userRole ?? this.userRole,
      );
  @override
  String toString() {
    return (StringBuffer('SessionData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userFirstName: $userFirstName, ')
          ..write('userLastName: $userLastName, ')
          ..write('userRole: $userRole')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, userFirstName, userLastName, userRole);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.userFirstName == this.userFirstName &&
          other.userLastName == this.userLastName &&
          other.userRole == this.userRole);
}

class SessionCompanion extends UpdateCompanion<SessionData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> userFirstName;
  final Value<String> userLastName;
  final Value<String> userRole;
  const SessionCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.userFirstName = const Value.absent(),
    this.userLastName = const Value.absent(),
    this.userRole = const Value.absent(),
  });
  SessionCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String userFirstName,
    required String userLastName,
    required String userRole,
  })  : userId = Value(userId),
        userFirstName = Value(userFirstName),
        userLastName = Value(userLastName),
        userRole = Value(userRole);
  static Insertable<SessionData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? userFirstName,
    Expression<String>? userLastName,
    Expression<String>? userRole,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (userFirstName != null) 'user_first_name': userFirstName,
      if (userLastName != null) 'user_last_name': userLastName,
      if (userRole != null) 'user_role': userRole,
    });
  }

  SessionCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? userFirstName,
      Value<String>? userLastName,
      Value<String>? userRole}) {
    return SessionCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      userRole: userRole ?? this.userRole,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (userFirstName.present) {
      map['user_first_name'] = Variable<String>(userFirstName.value);
    }
    if (userLastName.present) {
      map['user_last_name'] = Variable<String>(userLastName.value);
    }
    if (userRole.present) {
      map['user_role'] = Variable<String>(userRole.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userFirstName: $userFirstName, ')
          ..write('userLastName: $userLastName, ')
          ..write('userRole: $userRole')
          ..write(')'))
        .toString();
  }
}

class $RegisterShiftsTable extends RegisterShifts
    with TableInfo<$RegisterShiftsTable, RegisterShiftModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegisterShiftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _registerIdMeta =
      const VerificationMeta('registerId');
  @override
  late final GeneratedColumn<int> registerId = GeneratedColumn<int>(
      'register_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _openingAmountMeta =
      const VerificationMeta('openingAmount');
  @override
  late final GeneratedColumn<double> openingAmount = GeneratedColumn<double>(
      'opening_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _closingAmountMeta =
      const VerificationMeta('closingAmount');
  @override
  late final GeneratedColumn<double> closingAmount = GeneratedColumn<double>(
      'closing_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('open'));
  static const VerificationMeta _openedAtMeta =
      const VerificationMeta('openedAt');
  @override
  late final GeneratedColumn<DateTime> openedAt = GeneratedColumn<DateTime>(
      'opened_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _closedAtMeta =
      const VerificationMeta('closedAt');
  @override
  late final GeneratedColumn<DateTime> closedAt = GeneratedColumn<DateTime>(
      'closed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        registerId,
        openingAmount,
        closingAmount,
        status,
        openedAt,
        closedAt,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'register_shifts';
  @override
  VerificationContext validateIntegrity(Insertable<RegisterShiftModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('register_id')) {
      context.handle(
          _registerIdMeta,
          registerId.isAcceptableOrUnknown(
              data['register_id']!, _registerIdMeta));
    } else if (isInserting) {
      context.missing(_registerIdMeta);
    }
    if (data.containsKey('opening_amount')) {
      context.handle(
          _openingAmountMeta,
          openingAmount.isAcceptableOrUnknown(
              data['opening_amount']!, _openingAmountMeta));
    }
    if (data.containsKey('closing_amount')) {
      context.handle(
          _closingAmountMeta,
          closingAmount.isAcceptableOrUnknown(
              data['closing_amount']!, _closingAmountMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('opened_at')) {
      context.handle(_openedAtMeta,
          openedAt.isAcceptableOrUnknown(data['opened_at']!, _openedAtMeta));
    }
    if (data.containsKey('closed_at')) {
      context.handle(_closedAtMeta,
          closedAt.isAcceptableOrUnknown(data['closed_at']!, _closedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegisterShiftModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegisterShiftModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      registerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}register_id'])!,
      openingAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}opening_amount']),
      closingAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}closing_amount']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      openedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}opened_at']),
      closedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}closed_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $RegisterShiftsTable createAlias(String alias) {
    return $RegisterShiftsTable(attachedDatabase, alias);
  }
}

class RegisterShiftModel extends DataClass
    implements Insertable<RegisterShiftModel> {
  final int id;
  final int userId;
  final int registerId;
  final double? openingAmount;
  final double? closingAmount;
  final String status;
  final DateTime? openedAt;
  final DateTime? closedAt;
  final DateTime createdAt;
  const RegisterShiftModel(
      {required this.id,
      required this.userId,
      required this.registerId,
      this.openingAmount,
      this.closingAmount,
      required this.status,
      this.openedAt,
      this.closedAt,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['register_id'] = Variable<int>(registerId);
    if (!nullToAbsent || openingAmount != null) {
      map['opening_amount'] = Variable<double>(openingAmount);
    }
    if (!nullToAbsent || closingAmount != null) {
      map['closing_amount'] = Variable<double>(closingAmount);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || openedAt != null) {
      map['opened_at'] = Variable<DateTime>(openedAt);
    }
    if (!nullToAbsent || closedAt != null) {
      map['closed_at'] = Variable<DateTime>(closedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RegisterShiftsCompanion toCompanion(bool nullToAbsent) {
    return RegisterShiftsCompanion(
      id: Value(id),
      userId: Value(userId),
      registerId: Value(registerId),
      openingAmount: openingAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(openingAmount),
      closingAmount: closingAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(closingAmount),
      status: Value(status),
      openedAt: openedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(openedAt),
      closedAt: closedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(closedAt),
      createdAt: Value(createdAt),
    );
  }

  factory RegisterShiftModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegisterShiftModel(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      registerId: serializer.fromJson<int>(json['registerId']),
      openingAmount: serializer.fromJson<double?>(json['openingAmount']),
      closingAmount: serializer.fromJson<double?>(json['closingAmount']),
      status: serializer.fromJson<String>(json['status']),
      openedAt: serializer.fromJson<DateTime?>(json['openedAt']),
      closedAt: serializer.fromJson<DateTime?>(json['closedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'registerId': serializer.toJson<int>(registerId),
      'openingAmount': serializer.toJson<double?>(openingAmount),
      'closingAmount': serializer.toJson<double?>(closingAmount),
      'status': serializer.toJson<String>(status),
      'openedAt': serializer.toJson<DateTime?>(openedAt),
      'closedAt': serializer.toJson<DateTime?>(closedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RegisterShiftModel copyWith(
          {int? id,
          int? userId,
          int? registerId,
          Value<double?> openingAmount = const Value.absent(),
          Value<double?> closingAmount = const Value.absent(),
          String? status,
          Value<DateTime?> openedAt = const Value.absent(),
          Value<DateTime?> closedAt = const Value.absent(),
          DateTime? createdAt}) =>
      RegisterShiftModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        registerId: registerId ?? this.registerId,
        openingAmount:
            openingAmount.present ? openingAmount.value : this.openingAmount,
        closingAmount:
            closingAmount.present ? closingAmount.value : this.closingAmount,
        status: status ?? this.status,
        openedAt: openedAt.present ? openedAt.value : this.openedAt,
        closedAt: closedAt.present ? closedAt.value : this.closedAt,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('RegisterShiftModel(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('registerId: $registerId, ')
          ..write('openingAmount: $openingAmount, ')
          ..write('closingAmount: $closingAmount, ')
          ..write('status: $status, ')
          ..write('openedAt: $openedAt, ')
          ..write('closedAt: $closedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, registerId, openingAmount,
      closingAmount, status, openedAt, closedAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegisterShiftModel &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.registerId == this.registerId &&
          other.openingAmount == this.openingAmount &&
          other.closingAmount == this.closingAmount &&
          other.status == this.status &&
          other.openedAt == this.openedAt &&
          other.closedAt == this.closedAt &&
          other.createdAt == this.createdAt);
}

class RegisterShiftsCompanion extends UpdateCompanion<RegisterShiftModel> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> registerId;
  final Value<double?> openingAmount;
  final Value<double?> closingAmount;
  final Value<String> status;
  final Value<DateTime?> openedAt;
  final Value<DateTime?> closedAt;
  final Value<DateTime> createdAt;
  const RegisterShiftsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.registerId = const Value.absent(),
    this.openingAmount = const Value.absent(),
    this.closingAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RegisterShiftsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int registerId,
    this.openingAmount = const Value.absent(),
    this.closingAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.openedAt = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : userId = Value(userId),
        registerId = Value(registerId);
  static Insertable<RegisterShiftModel> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? registerId,
    Expression<double>? openingAmount,
    Expression<double>? closingAmount,
    Expression<String>? status,
    Expression<DateTime>? openedAt,
    Expression<DateTime>? closedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (registerId != null) 'register_id': registerId,
      if (openingAmount != null) 'opening_amount': openingAmount,
      if (closingAmount != null) 'closing_amount': closingAmount,
      if (status != null) 'status': status,
      if (openedAt != null) 'opened_at': openedAt,
      if (closedAt != null) 'closed_at': closedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RegisterShiftsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? registerId,
      Value<double?>? openingAmount,
      Value<double?>? closingAmount,
      Value<String>? status,
      Value<DateTime?>? openedAt,
      Value<DateTime?>? closedAt,
      Value<DateTime>? createdAt}) {
    return RegisterShiftsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      registerId: registerId ?? this.registerId,
      openingAmount: openingAmount ?? this.openingAmount,
      closingAmount: closingAmount ?? this.closingAmount,
      status: status ?? this.status,
      openedAt: openedAt ?? this.openedAt,
      closedAt: closedAt ?? this.closedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (registerId.present) {
      map['register_id'] = Variable<int>(registerId.value);
    }
    if (openingAmount.present) {
      map['opening_amount'] = Variable<double>(openingAmount.value);
    }
    if (closingAmount.present) {
      map['closing_amount'] = Variable<double>(closingAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (openedAt.present) {
      map['opened_at'] = Variable<DateTime>(openedAt.value);
    }
    if (closedAt.present) {
      map['closed_at'] = Variable<DateTime>(closedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegisterShiftsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('registerId: $registerId, ')
          ..write('openingAmount: $openingAmount, ')
          ..write('closingAmount: $closingAmount, ')
          ..write('status: $status, ')
          ..write('openedAt: $openedAt, ')
          ..write('closedAt: $closedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProductCatalogTable extends ProductCatalog
    with TableInfo<$ProductCatalogTable, CatalogItemModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCatalogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
      'stock', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, stock, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_catalog';
  @override
  VerificationContext validateIntegrity(Insertable<CatalogItemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
          _stockMeta, stock.isAcceptableOrUnknown(data['stock']!, _stockMeta));
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatalogItemModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatalogItemModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      stock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}stock'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $ProductCatalogTable createAlias(String alias) {
    return $ProductCatalogTable(attachedDatabase, alias);
  }
}

class CatalogItemModel extends DataClass
    implements Insertable<CatalogItemModel> {
  final int id;
  final String name;
  final int stock;
  final double price;
  const CatalogItemModel(
      {required this.id,
      required this.name,
      required this.stock,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['stock'] = Variable<int>(stock);
    map['price'] = Variable<double>(price);
    return map;
  }

  ProductCatalogCompanion toCompanion(bool nullToAbsent) {
    return ProductCatalogCompanion(
      id: Value(id),
      name: Value(name),
      stock: Value(stock),
      price: Value(price),
    );
  }

  factory CatalogItemModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatalogItemModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      stock: serializer.fromJson<int>(json['stock']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'stock': serializer.toJson<int>(stock),
      'price': serializer.toJson<double>(price),
    };
  }

  CatalogItemModel copyWith(
          {int? id, String? name, int? stock, double? price}) =>
      CatalogItemModel(
        id: id ?? this.id,
        name: name ?? this.name,
        stock: stock ?? this.stock,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('CatalogItemModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stock: $stock, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, stock, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatalogItemModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.stock == this.stock &&
          other.price == this.price);
}

class ProductCatalogCompanion extends UpdateCompanion<CatalogItemModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> stock;
  final Value<double> price;
  const ProductCatalogCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.stock = const Value.absent(),
    this.price = const Value.absent(),
  });
  ProductCatalogCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int stock,
    required double price,
  })  : name = Value(name),
        stock = Value(stock),
        price = Value(price);
  static Insertable<CatalogItemModel> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? stock,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stock != null) 'stock': stock,
      if (price != null) 'price': price,
    });
  }

  ProductCatalogCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? stock,
      Value<double>? price}) {
    return ProductCatalogCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCatalogCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stock: $stock, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, TransactionModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _receiptIdMeta =
      const VerificationMeta('receiptId');
  @override
  late final GeneratedColumn<String> receiptId = GeneratedColumn<String>(
      'receipt_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _saleTransactionIdMeta =
      const VerificationMeta('saleTransactionId');
  @override
  late final GeneratedColumn<int> saleTransactionId = GeneratedColumn<int>(
      'sale_transaction_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _saleTransactionReceiptIdMeta =
      const VerificationMeta('saleTransactionReceiptId');
  @override
  late final GeneratedColumn<String> saleTransactionReceiptId =
      GeneratedColumn<String>('sale_transaction_receipt_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _registerIdMeta =
      const VerificationMeta('registerId');
  @override
  late final GeneratedColumn<int> registerId = GeneratedColumn<int>(
      'register_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _registerNameMeta =
      const VerificationMeta('registerName');
  @override
  late final GeneratedColumn<String> registerName = GeneratedColumn<String>(
      'register_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _branchNameMeta =
      const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String> branchName = GeneratedColumn<String>(
      'branch_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _employeeFirstNameMeta =
      const VerificationMeta('employeeFirstName');
  @override
  late final GeneratedColumn<String> employeeFirstName =
      GeneratedColumn<String>('employee_first_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeLastNameMeta =
      const VerificationMeta('employeeLastName');
  @override
  late final GeneratedColumn<String> employeeLastName = GeneratedColumn<String>(
      'employee_last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalDiscountAmountMeta =
      const VerificationMeta('totalDiscountAmount');
  @override
  late final GeneratedColumn<double> totalDiscountAmount =
      GeneratedColumn<double>('total_discount_amount', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  static const VerificationMeta _taxMeta = const VerificationMeta('tax');
  @override
  late final GeneratedColumn<double> tax = GeneratedColumn<double>(
      'tax', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountPaidMeta =
      const VerificationMeta('amountPaid');
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
      'amount_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _reasonForReturnMeta =
      const VerificationMeta('reasonForReturn');
  @override
  late final GeneratedColumn<String> reasonForReturn = GeneratedColumn<String>(
      'reason_for_return', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        receiptId,
        type,
        saleTransactionId,
        saleTransactionReceiptId,
        status,
        registerId,
        registerName,
        branchId,
        branchName,
        employeeId,
        employeeFirstName,
        employeeLastName,
        subtotal,
        totalDiscountAmount,
        tax,
        total,
        amountPaid,
        reasonForReturn,
        createdAt,
        isSynced
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('receipt_id')) {
      context.handle(_receiptIdMeta,
          receiptId.isAcceptableOrUnknown(data['receipt_id']!, _receiptIdMeta));
    } else if (isInserting) {
      context.missing(_receiptIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('sale_transaction_id')) {
      context.handle(
          _saleTransactionIdMeta,
          saleTransactionId.isAcceptableOrUnknown(
              data['sale_transaction_id']!, _saleTransactionIdMeta));
    }
    if (data.containsKey('sale_transaction_receipt_id')) {
      context.handle(
          _saleTransactionReceiptIdMeta,
          saleTransactionReceiptId.isAcceptableOrUnknown(
              data['sale_transaction_receipt_id']!,
              _saleTransactionReceiptIdMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('register_id')) {
      context.handle(
          _registerIdMeta,
          registerId.isAcceptableOrUnknown(
              data['register_id']!, _registerIdMeta));
    } else if (isInserting) {
      context.missing(_registerIdMeta);
    }
    if (data.containsKey('register_name')) {
      context.handle(
          _registerNameMeta,
          registerName.isAcceptableOrUnknown(
              data['register_name']!, _registerNameMeta));
    } else if (isInserting) {
      context.missing(_registerNameMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    } else if (isInserting) {
      context.missing(_branchNameMeta);
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('employee_first_name')) {
      context.handle(
          _employeeFirstNameMeta,
          employeeFirstName.isAcceptableOrUnknown(
              data['employee_first_name']!, _employeeFirstNameMeta));
    } else if (isInserting) {
      context.missing(_employeeFirstNameMeta);
    }
    if (data.containsKey('employee_last_name')) {
      context.handle(
          _employeeLastNameMeta,
          employeeLastName.isAcceptableOrUnknown(
              data['employee_last_name']!, _employeeLastNameMeta));
    } else if (isInserting) {
      context.missing(_employeeLastNameMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('total_discount_amount')) {
      context.handle(
          _totalDiscountAmountMeta,
          totalDiscountAmount.isAcceptableOrUnknown(
              data['total_discount_amount']!, _totalDiscountAmountMeta));
    }
    if (data.containsKey('tax')) {
      context.handle(
          _taxMeta, tax.isAcceptableOrUnknown(data['tax']!, _taxMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
          _amountPaidMeta,
          amountPaid.isAcceptableOrUnknown(
              data['amount_paid']!, _amountPaidMeta));
    }
    if (data.containsKey('reason_for_return')) {
      context.handle(
          _reasonForReturnMeta,
          reasonForReturn.isAcceptableOrUnknown(
              data['reason_for_return']!, _reasonForReturnMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiptId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      saleTransactionId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}sale_transaction_id']),
      saleTransactionReceiptId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sale_transaction_receipt_id']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      registerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}register_id'])!,
      registerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}register_name'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id'])!,
      branchName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_name'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id'])!,
      employeeFirstName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}employee_first_name'])!,
      employeeLastName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}employee_last_name'])!,
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      totalDiscountAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}total_discount_amount'])!,
      tax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      amountPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_paid'])!,
      reasonForReturn: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reason_for_return']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class TransactionModel extends DataClass
    implements Insertable<TransactionModel> {
  final int id;
  final String receiptId;
  final String type;
  final int? saleTransactionId;
  final String? saleTransactionReceiptId;
  final String? status;
  final int registerId;
  final String registerName;
  final int branchId;
  final String branchName;
  final int employeeId;
  final String employeeFirstName;
  final String employeeLastName;
  final double subtotal;
  final double totalDiscountAmount;
  final double tax;
  final double total;
  final double amountPaid;
  final String? reasonForReturn;
  final DateTime createdAt;
  final bool isSynced;
  const TransactionModel(
      {required this.id,
      required this.receiptId,
      required this.type,
      this.saleTransactionId,
      this.saleTransactionReceiptId,
      this.status,
      required this.registerId,
      required this.registerName,
      required this.branchId,
      required this.branchName,
      required this.employeeId,
      required this.employeeFirstName,
      required this.employeeLastName,
      required this.subtotal,
      required this.totalDiscountAmount,
      required this.tax,
      required this.total,
      required this.amountPaid,
      this.reasonForReturn,
      required this.createdAt,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<String>(receiptId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || saleTransactionId != null) {
      map['sale_transaction_id'] = Variable<int>(saleTransactionId);
    }
    if (!nullToAbsent || saleTransactionReceiptId != null) {
      map['sale_transaction_receipt_id'] =
          Variable<String>(saleTransactionReceiptId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    map['register_id'] = Variable<int>(registerId);
    map['register_name'] = Variable<String>(registerName);
    map['branch_id'] = Variable<int>(branchId);
    map['branch_name'] = Variable<String>(branchName);
    map['employee_id'] = Variable<int>(employeeId);
    map['employee_first_name'] = Variable<String>(employeeFirstName);
    map['employee_last_name'] = Variable<String>(employeeLastName);
    map['subtotal'] = Variable<double>(subtotal);
    map['total_discount_amount'] = Variable<double>(totalDiscountAmount);
    map['tax'] = Variable<double>(tax);
    map['total'] = Variable<double>(total);
    map['amount_paid'] = Variable<double>(amountPaid);
    if (!nullToAbsent || reasonForReturn != null) {
      map['reason_for_return'] = Variable<String>(reasonForReturn);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      type: Value(type),
      saleTransactionId: saleTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(saleTransactionId),
      saleTransactionReceiptId: saleTransactionReceiptId == null && nullToAbsent
          ? const Value.absent()
          : Value(saleTransactionReceiptId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      registerId: Value(registerId),
      registerName: Value(registerName),
      branchId: Value(branchId),
      branchName: Value(branchName),
      employeeId: Value(employeeId),
      employeeFirstName: Value(employeeFirstName),
      employeeLastName: Value(employeeLastName),
      subtotal: Value(subtotal),
      totalDiscountAmount: Value(totalDiscountAmount),
      tax: Value(tax),
      total: Value(total),
      amountPaid: Value(amountPaid),
      reasonForReturn: reasonForReturn == null && nullToAbsent
          ? const Value.absent()
          : Value(reasonForReturn),
      createdAt: Value(createdAt),
      isSynced: Value(isSynced),
    );
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionModel(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<String>(json['receiptId']),
      type: serializer.fromJson<String>(json['type']),
      saleTransactionId: serializer.fromJson<int?>(json['saleTransactionId']),
      saleTransactionReceiptId:
          serializer.fromJson<String?>(json['saleTransactionReceiptId']),
      status: serializer.fromJson<String?>(json['status']),
      registerId: serializer.fromJson<int>(json['registerId']),
      registerName: serializer.fromJson<String>(json['registerName']),
      branchId: serializer.fromJson<int>(json['branchId']),
      branchName: serializer.fromJson<String>(json['branchName']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      employeeFirstName: serializer.fromJson<String>(json['employeeFirstName']),
      employeeLastName: serializer.fromJson<String>(json['employeeLastName']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      totalDiscountAmount:
          serializer.fromJson<double>(json['totalDiscountAmount']),
      tax: serializer.fromJson<double>(json['tax']),
      total: serializer.fromJson<double>(json['total']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      reasonForReturn: serializer.fromJson<String?>(json['reasonForReturn']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptId': serializer.toJson<String>(receiptId),
      'type': serializer.toJson<String>(type),
      'saleTransactionId': serializer.toJson<int?>(saleTransactionId),
      'saleTransactionReceiptId':
          serializer.toJson<String?>(saleTransactionReceiptId),
      'status': serializer.toJson<String?>(status),
      'registerId': serializer.toJson<int>(registerId),
      'registerName': serializer.toJson<String>(registerName),
      'branchId': serializer.toJson<int>(branchId),
      'branchName': serializer.toJson<String>(branchName),
      'employeeId': serializer.toJson<int>(employeeId),
      'employeeFirstName': serializer.toJson<String>(employeeFirstName),
      'employeeLastName': serializer.toJson<String>(employeeLastName),
      'subtotal': serializer.toJson<double>(subtotal),
      'totalDiscountAmount': serializer.toJson<double>(totalDiscountAmount),
      'tax': serializer.toJson<double>(tax),
      'total': serializer.toJson<double>(total),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'reasonForReturn': serializer.toJson<String?>(reasonForReturn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  TransactionModel copyWith(
          {int? id,
          String? receiptId,
          String? type,
          Value<int?> saleTransactionId = const Value.absent(),
          Value<String?> saleTransactionReceiptId = const Value.absent(),
          Value<String?> status = const Value.absent(),
          int? registerId,
          String? registerName,
          int? branchId,
          String? branchName,
          int? employeeId,
          String? employeeFirstName,
          String? employeeLastName,
          double? subtotal,
          double? totalDiscountAmount,
          double? tax,
          double? total,
          double? amountPaid,
          Value<String?> reasonForReturn = const Value.absent(),
          DateTime? createdAt,
          bool? isSynced}) =>
      TransactionModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        type: type ?? this.type,
        saleTransactionId: saleTransactionId.present
            ? saleTransactionId.value
            : this.saleTransactionId,
        saleTransactionReceiptId: saleTransactionReceiptId.present
            ? saleTransactionReceiptId.value
            : this.saleTransactionReceiptId,
        status: status.present ? status.value : this.status,
        registerId: registerId ?? this.registerId,
        registerName: registerName ?? this.registerName,
        branchId: branchId ?? this.branchId,
        branchName: branchName ?? this.branchName,
        employeeId: employeeId ?? this.employeeId,
        employeeFirstName: employeeFirstName ?? this.employeeFirstName,
        employeeLastName: employeeLastName ?? this.employeeLastName,
        subtotal: subtotal ?? this.subtotal,
        totalDiscountAmount: totalDiscountAmount ?? this.totalDiscountAmount,
        tax: tax ?? this.tax,
        total: total ?? this.total,
        amountPaid: amountPaid ?? this.amountPaid,
        reasonForReturn: reasonForReturn.present
            ? reasonForReturn.value
            : this.reasonForReturn,
        createdAt: createdAt ?? this.createdAt,
        isSynced: isSynced ?? this.isSynced,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionModel(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('type: $type, ')
          ..write('saleTransactionId: $saleTransactionId, ')
          ..write('saleTransactionReceiptId: $saleTransactionReceiptId, ')
          ..write('status: $status, ')
          ..write('registerId: $registerId, ')
          ..write('registerName: $registerName, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeeFirstName: $employeeFirstName, ')
          ..write('employeeLastName: $employeeLastName, ')
          ..write('subtotal: $subtotal, ')
          ..write('totalDiscountAmount: $totalDiscountAmount, ')
          ..write('tax: $tax, ')
          ..write('total: $total, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('reasonForReturn: $reasonForReturn, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        receiptId,
        type,
        saleTransactionId,
        saleTransactionReceiptId,
        status,
        registerId,
        registerName,
        branchId,
        branchName,
        employeeId,
        employeeFirstName,
        employeeLastName,
        subtotal,
        totalDiscountAmount,
        tax,
        total,
        amountPaid,
        reasonForReturn,
        createdAt,
        isSynced
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.type == this.type &&
          other.saleTransactionId == this.saleTransactionId &&
          other.saleTransactionReceiptId == this.saleTransactionReceiptId &&
          other.status == this.status &&
          other.registerId == this.registerId &&
          other.registerName == this.registerName &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.employeeId == this.employeeId &&
          other.employeeFirstName == this.employeeFirstName &&
          other.employeeLastName == this.employeeLastName &&
          other.subtotal == this.subtotal &&
          other.totalDiscountAmount == this.totalDiscountAmount &&
          other.tax == this.tax &&
          other.total == this.total &&
          other.amountPaid == this.amountPaid &&
          other.reasonForReturn == this.reasonForReturn &&
          other.createdAt == this.createdAt &&
          other.isSynced == this.isSynced);
}

class TransactionsCompanion extends UpdateCompanion<TransactionModel> {
  final Value<int> id;
  final Value<String> receiptId;
  final Value<String> type;
  final Value<int?> saleTransactionId;
  final Value<String?> saleTransactionReceiptId;
  final Value<String?> status;
  final Value<int> registerId;
  final Value<String> registerName;
  final Value<int> branchId;
  final Value<String> branchName;
  final Value<int> employeeId;
  final Value<String> employeeFirstName;
  final Value<String> employeeLastName;
  final Value<double> subtotal;
  final Value<double> totalDiscountAmount;
  final Value<double> tax;
  final Value<double> total;
  final Value<double> amountPaid;
  final Value<String?> reasonForReturn;
  final Value<DateTime> createdAt;
  final Value<bool> isSynced;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.type = const Value.absent(),
    this.saleTransactionId = const Value.absent(),
    this.saleTransactionReceiptId = const Value.absent(),
    this.status = const Value.absent(),
    this.registerId = const Value.absent(),
    this.registerName = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.employeeFirstName = const Value.absent(),
    this.employeeLastName = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.totalDiscountAmount = const Value.absent(),
    this.tax = const Value.absent(),
    this.total = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.reasonForReturn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String receiptId,
    required String type,
    this.saleTransactionId = const Value.absent(),
    this.saleTransactionReceiptId = const Value.absent(),
    this.status = const Value.absent(),
    required int registerId,
    required String registerName,
    required int branchId,
    required String branchName,
    required int employeeId,
    required String employeeFirstName,
    required String employeeLastName,
    required double subtotal,
    this.totalDiscountAmount = const Value.absent(),
    this.tax = const Value.absent(),
    required double total,
    this.amountPaid = const Value.absent(),
    this.reasonForReturn = const Value.absent(),
    required DateTime createdAt,
    this.isSynced = const Value.absent(),
  })  : receiptId = Value(receiptId),
        type = Value(type),
        registerId = Value(registerId),
        registerName = Value(registerName),
        branchId = Value(branchId),
        branchName = Value(branchName),
        employeeId = Value(employeeId),
        employeeFirstName = Value(employeeFirstName),
        employeeLastName = Value(employeeLastName),
        subtotal = Value(subtotal),
        total = Value(total),
        createdAt = Value(createdAt);
  static Insertable<TransactionModel> custom({
    Expression<int>? id,
    Expression<String>? receiptId,
    Expression<String>? type,
    Expression<int>? saleTransactionId,
    Expression<String>? saleTransactionReceiptId,
    Expression<String>? status,
    Expression<int>? registerId,
    Expression<String>? registerName,
    Expression<int>? branchId,
    Expression<String>? branchName,
    Expression<int>? employeeId,
    Expression<String>? employeeFirstName,
    Expression<String>? employeeLastName,
    Expression<double>? subtotal,
    Expression<double>? totalDiscountAmount,
    Expression<double>? tax,
    Expression<double>? total,
    Expression<double>? amountPaid,
    Expression<String>? reasonForReturn,
    Expression<DateTime>? createdAt,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (type != null) 'type': type,
      if (saleTransactionId != null) 'sale_transaction_id': saleTransactionId,
      if (saleTransactionReceiptId != null)
        'sale_transaction_receipt_id': saleTransactionReceiptId,
      if (status != null) 'status': status,
      if (registerId != null) 'register_id': registerId,
      if (registerName != null) 'register_name': registerName,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (employeeId != null) 'employee_id': employeeId,
      if (employeeFirstName != null) 'employee_first_name': employeeFirstName,
      if (employeeLastName != null) 'employee_last_name': employeeLastName,
      if (subtotal != null) 'subtotal': subtotal,
      if (totalDiscountAmount != null)
        'total_discount_amount': totalDiscountAmount,
      if (tax != null) 'tax': tax,
      if (total != null) 'total': total,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (reasonForReturn != null) 'reason_for_return': reasonForReturn,
      if (createdAt != null) 'created_at': createdAt,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? receiptId,
      Value<String>? type,
      Value<int?>? saleTransactionId,
      Value<String?>? saleTransactionReceiptId,
      Value<String?>? status,
      Value<int>? registerId,
      Value<String>? registerName,
      Value<int>? branchId,
      Value<String>? branchName,
      Value<int>? employeeId,
      Value<String>? employeeFirstName,
      Value<String>? employeeLastName,
      Value<double>? subtotal,
      Value<double>? totalDiscountAmount,
      Value<double>? tax,
      Value<double>? total,
      Value<double>? amountPaid,
      Value<String?>? reasonForReturn,
      Value<DateTime>? createdAt,
      Value<bool>? isSynced}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      type: type ?? this.type,
      saleTransactionId: saleTransactionId ?? this.saleTransactionId,
      saleTransactionReceiptId:
          saleTransactionReceiptId ?? this.saleTransactionReceiptId,
      status: status ?? this.status,
      registerId: registerId ?? this.registerId,
      registerName: registerName ?? this.registerName,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      employeeId: employeeId ?? this.employeeId,
      employeeFirstName: employeeFirstName ?? this.employeeFirstName,
      employeeLastName: employeeLastName ?? this.employeeLastName,
      subtotal: subtotal ?? this.subtotal,
      totalDiscountAmount: totalDiscountAmount ?? this.totalDiscountAmount,
      tax: tax ?? this.tax,
      total: total ?? this.total,
      amountPaid: amountPaid ?? this.amountPaid,
      reasonForReturn: reasonForReturn ?? this.reasonForReturn,
      createdAt: createdAt ?? this.createdAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (receiptId.present) {
      map['receipt_id'] = Variable<String>(receiptId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (saleTransactionId.present) {
      map['sale_transaction_id'] = Variable<int>(saleTransactionId.value);
    }
    if (saleTransactionReceiptId.present) {
      map['sale_transaction_receipt_id'] =
          Variable<String>(saleTransactionReceiptId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (registerId.present) {
      map['register_id'] = Variable<int>(registerId.value);
    }
    if (registerName.present) {
      map['register_name'] = Variable<String>(registerName.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (employeeFirstName.present) {
      map['employee_first_name'] = Variable<String>(employeeFirstName.value);
    }
    if (employeeLastName.present) {
      map['employee_last_name'] = Variable<String>(employeeLastName.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (totalDiscountAmount.present) {
      map['total_discount_amount'] =
          Variable<double>(totalDiscountAmount.value);
    }
    if (tax.present) {
      map['tax'] = Variable<double>(tax.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (reasonForReturn.present) {
      map['reason_for_return'] = Variable<String>(reasonForReturn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('type: $type, ')
          ..write('saleTransactionId: $saleTransactionId, ')
          ..write('saleTransactionReceiptId: $saleTransactionReceiptId, ')
          ..write('status: $status, ')
          ..write('registerId: $registerId, ')
          ..write('registerName: $registerName, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeeFirstName: $employeeFirstName, ')
          ..write('employeeLastName: $employeeLastName, ')
          ..write('subtotal: $subtotal, ')
          ..write('totalDiscountAmount: $totalDiscountAmount, ')
          ..write('tax: $tax, ')
          ..write('total: $total, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('reasonForReturn: $reasonForReturn, ')
          ..write('createdAt: $createdAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $TransactionItemsTable extends TransactionItems
    with TableInfo<$TransactionItemsTable, TransactionItemModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _discountAmountMeta =
      const VerificationMeta('discountAmount');
  @override
  late final GeneratedColumn<double> discountAmount = GeneratedColumn<double>(
      'discount_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalDiscountAmountMeta =
      const VerificationMeta('totalDiscountAmount');
  @override
  late final GeneratedColumn<double> totalDiscountAmount =
      GeneratedColumn<double>('total_discount_amount', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _subtotalMeta =
      const VerificationMeta('subtotal');
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
      'subtotal', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        transactionId,
        itemId,
        itemName,
        quantity,
        price,
        discountType,
        discount,
        discountAmount,
        totalDiscountAmount,
        subtotal,
        total
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<TransactionItemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
          _discountAmountMeta,
          discountAmount.isAcceptableOrUnknown(
              data['discount_amount']!, _discountAmountMeta));
    }
    if (data.containsKey('total_discount_amount')) {
      context.handle(
          _totalDiscountAmountMeta,
          totalDiscountAmount.isAcceptableOrUnknown(
              data['total_discount_amount']!, _totalDiscountAmountMeta));
    }
    if (data.containsKey('subtotal')) {
      context.handle(_subtotalMeta,
          subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta));
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionItemModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionItemModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type']),
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount']),
      discountAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount_amount']),
      totalDiscountAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_discount_amount']),
      subtotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
    );
  }

  @override
  $TransactionItemsTable createAlias(String alias) {
    return $TransactionItemsTable(attachedDatabase, alias);
  }
}

class TransactionItemModel extends DataClass
    implements Insertable<TransactionItemModel> {
  final int id;
  final int transactionId;
  final int itemId;
  final String itemName;
  final int quantity;
  final double price;
  final String? discountType;
  final double? discount;
  final double? discountAmount;
  final double? totalDiscountAmount;
  final double subtotal;
  final double total;
  const TransactionItemModel(
      {required this.id,
      required this.transactionId,
      required this.itemId,
      required this.itemName,
      required this.quantity,
      required this.price,
      this.discountType,
      this.discount,
      this.discountAmount,
      this.totalDiscountAmount,
      required this.subtotal,
      required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['item_id'] = Variable<int>(itemId);
    map['item_name'] = Variable<String>(itemName);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || discountType != null) {
      map['discount_type'] = Variable<String>(discountType);
    }
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double>(discount);
    }
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    if (!nullToAbsent || totalDiscountAmount != null) {
      map['total_discount_amount'] = Variable<double>(totalDiscountAmount);
    }
    map['subtotal'] = Variable<double>(subtotal);
    map['total'] = Variable<double>(total);
    return map;
  }

  TransactionItemsCompanion toCompanion(bool nullToAbsent) {
    return TransactionItemsCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      itemId: Value(itemId),
      itemName: Value(itemName),
      quantity: Value(quantity),
      price: Value(price),
      discountType: discountType == null && nullToAbsent
          ? const Value.absent()
          : Value(discountType),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
      totalDiscountAmount: totalDiscountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(totalDiscountAmount),
      subtotal: Value(subtotal),
      total: Value(total),
    );
  }

  factory TransactionItemModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionItemModel(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      itemId: serializer.fromJson<int>(json['itemId']),
      itemName: serializer.fromJson<String>(json['itemName']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      discountType: serializer.fromJson<String?>(json['discountType']),
      discount: serializer.fromJson<double?>(json['discount']),
      discountAmount: serializer.fromJson<double?>(json['discountAmount']),
      totalDiscountAmount:
          serializer.fromJson<double?>(json['totalDiscountAmount']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      total: serializer.fromJson<double>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int>(transactionId),
      'itemId': serializer.toJson<int>(itemId),
      'itemName': serializer.toJson<String>(itemName),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
      'discountType': serializer.toJson<String?>(discountType),
      'discount': serializer.toJson<double?>(discount),
      'discountAmount': serializer.toJson<double?>(discountAmount),
      'totalDiscountAmount': serializer.toJson<double?>(totalDiscountAmount),
      'subtotal': serializer.toJson<double>(subtotal),
      'total': serializer.toJson<double>(total),
    };
  }

  TransactionItemModel copyWith(
          {int? id,
          int? transactionId,
          int? itemId,
          String? itemName,
          int? quantity,
          double? price,
          Value<String?> discountType = const Value.absent(),
          Value<double?> discount = const Value.absent(),
          Value<double?> discountAmount = const Value.absent(),
          Value<double?> totalDiscountAmount = const Value.absent(),
          double? subtotal,
          double? total}) =>
      TransactionItemModel(
        id: id ?? this.id,
        transactionId: transactionId ?? this.transactionId,
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        discountType:
            discountType.present ? discountType.value : this.discountType,
        discount: discount.present ? discount.value : this.discount,
        discountAmount:
            discountAmount.present ? discountAmount.value : this.discountAmount,
        totalDiscountAmount: totalDiscountAmount.present
            ? totalDiscountAmount.value
            : this.totalDiscountAmount,
        subtotal: subtotal ?? this.subtotal,
        total: total ?? this.total,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionItemModel(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('itemId: $itemId, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('discountType: $discountType, ')
          ..write('discount: $discount, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('totalDiscountAmount: $totalDiscountAmount, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      transactionId,
      itemId,
      itemName,
      quantity,
      price,
      discountType,
      discount,
      discountAmount,
      totalDiscountAmount,
      subtotal,
      total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionItemModel &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.itemId == this.itemId &&
          other.itemName == this.itemName &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.discountType == this.discountType &&
          other.discount == this.discount &&
          other.discountAmount == this.discountAmount &&
          other.totalDiscountAmount == this.totalDiscountAmount &&
          other.subtotal == this.subtotal &&
          other.total == this.total);
}

class TransactionItemsCompanion extends UpdateCompanion<TransactionItemModel> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<int> itemId;
  final Value<String> itemName;
  final Value<int> quantity;
  final Value<double> price;
  final Value<String?> discountType;
  final Value<double?> discount;
  final Value<double?> discountAmount;
  final Value<double?> totalDiscountAmount;
  final Value<double> subtotal;
  final Value<double> total;
  const TransactionItemsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.discountType = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.totalDiscountAmount = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.total = const Value.absent(),
  });
  TransactionItemsCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required int itemId,
    required String itemName,
    required int quantity,
    required double price,
    this.discountType = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.totalDiscountAmount = const Value.absent(),
    required double subtotal,
    required double total,
  })  : transactionId = Value(transactionId),
        itemId = Value(itemId),
        itemName = Value(itemName),
        quantity = Value(quantity),
        price = Value(price),
        subtotal = Value(subtotal),
        total = Value(total);
  static Insertable<TransactionItemModel> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<int>? itemId,
    Expression<String>? itemName,
    Expression<int>? quantity,
    Expression<double>? price,
    Expression<String>? discountType,
    Expression<double>? discount,
    Expression<double>? discountAmount,
    Expression<double>? totalDiscountAmount,
    Expression<double>? subtotal,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (itemId != null) 'item_id': itemId,
      if (itemName != null) 'item_name': itemName,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (discountType != null) 'discount_type': discountType,
      if (discount != null) 'discount': discount,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (totalDiscountAmount != null)
        'total_discount_amount': totalDiscountAmount,
      if (subtotal != null) 'subtotal': subtotal,
      if (total != null) 'total': total,
    });
  }

  TransactionItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? transactionId,
      Value<int>? itemId,
      Value<String>? itemName,
      Value<int>? quantity,
      Value<double>? price,
      Value<String?>? discountType,
      Value<double?>? discount,
      Value<double?>? discountAmount,
      Value<double?>? totalDiscountAmount,
      Value<double>? subtotal,
      Value<double>? total}) {
    return TransactionItemsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      discountType: discountType ?? this.discountType,
      discount: discount ?? this.discount,
      discountAmount: discountAmount ?? this.discountAmount,
      totalDiscountAmount: totalDiscountAmount ?? this.totalDiscountAmount,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (totalDiscountAmount.present) {
      map['total_discount_amount'] =
          Variable<double>(totalDiscountAmount.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItemsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('itemId: $itemId, ')
          ..write('itemName: $itemName, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('discountType: $discountType, ')
          ..write('discount: $discount, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('totalDiscountAmount: $totalDiscountAmount, ')
          ..write('subtotal: $subtotal, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tableMeta = const VerificationMeta('table');
  @override
  late final GeneratedColumn<String> table = GeneratedColumn<String>(
      'table', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, itemId, userId, table, data, lastError, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('table')) {
      context.handle(
          _tableMeta, table.isAcceptableOrUnknown(data['table']!, _tableMeta));
    } else if (isInserting) {
      context.missing(_tableMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      table: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final int itemId;
  final int userId;
  final String table;
  final String data;
  final String? lastError;
  final DateTime createdAt;
  const SyncQueueData(
      {required this.id,
      required this.itemId,
      required this.userId,
      required this.table,
      required this.data,
      this.lastError,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['user_id'] = Variable<int>(userId);
    map['table'] = Variable<String>(table);
    map['data'] = Variable<String>(data);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      itemId: Value(itemId),
      userId: Value(userId),
      table: Value(table),
      data: Value(data),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      userId: serializer.fromJson<int>(json['userId']),
      table: serializer.fromJson<String>(json['table']),
      data: serializer.fromJson<String>(json['data']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'userId': serializer.toJson<int>(userId),
      'table': serializer.toJson<String>(table),
      'data': serializer.toJson<String>(data),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SyncQueueData copyWith(
          {int? id,
          int? itemId,
          int? userId,
          String? table,
          String? data,
          Value<String?> lastError = const Value.absent(),
          DateTime? createdAt}) =>
      SyncQueueData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        userId: userId ?? this.userId,
        table: table ?? this.table,
        data: data ?? this.data,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('userId: $userId, ')
          ..write('table: $table, ')
          ..write('data: $data, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, itemId, userId, table, data, lastError, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.userId == this.userId &&
          other.table == this.table &&
          other.data == this.data &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<int> userId;
  final Value<String> table;
  final Value<String> data;
  final Value<String?> lastError;
  final Value<DateTime> createdAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.userId = const Value.absent(),
    this.table = const Value.absent(),
    this.data = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required int userId,
    required String table,
    required String data,
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : itemId = Value(itemId),
        userId = Value(userId),
        table = Value(table),
        data = Value(data);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<int>? userId,
    Expression<String>? table,
    Expression<String>? data,
    Expression<String>? lastError,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (userId != null) 'user_id': userId,
      if (table != null) 'table': table,
      if (data != null) 'data': data,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<int>? userId,
      Value<String>? table,
      Value<String>? data,
      Value<String?>? lastError,
      Value<DateTime>? createdAt}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      userId: userId ?? this.userId,
      table: table ?? this.table,
      data: data ?? this.data,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (table.present) {
      map['table'] = Variable<String>(table.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('userId: $userId, ')
          ..write('table: $table, ')
          ..write('data: $data, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [type, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(Insertable<SyncMetadataModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {type};
  @override
  SyncMetadataModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataModel(
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at'])!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataModel extends DataClass
    implements Insertable<SyncMetadataModel> {
  final String type;
  final DateTime lastSyncedAt;
  const SyncMetadataModel({required this.type, required this.lastSyncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['type'] = Variable<String>(type);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      type: Value(type),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  factory SyncMetadataModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataModel(
      type: serializer.fromJson<String>(json['type']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'type': serializer.toJson<String>(type),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
    };
  }

  SyncMetadataModel copyWith({String? type, DateTime? lastSyncedAt}) =>
      SyncMetadataModel(
        type: type ?? this.type,
        lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      );
  @override
  String toString() {
    return (StringBuffer('SyncMetadataModel(')
          ..write('type: $type, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(type, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataModel &&
          other.type == this.type &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataModel> {
  final Value<String> type;
  final Value<DateTime> lastSyncedAt;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.type = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String type,
    required DateTime lastSyncedAt,
    this.rowid = const Value.absent(),
  })  : type = Value(type),
        lastSyncedAt = Value(lastSyncedAt);
  static Insertable<SyncMetadataModel> custom({
    Expression<String>? type,
    Expression<DateTime>? lastSyncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (type != null) 'type': type,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith(
      {Value<String>? type, Value<DateTime>? lastSyncedAt, Value<int>? rowid}) {
    return SyncMetadataCompanion(
      type: type ?? this.type,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('type: $type, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, SettingsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _registerIdMeta =
      const VerificationMeta('registerId');
  @override
  late final GeneratedColumn<int> registerId = GeneratedColumn<int>(
      'register_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _registerNameMeta =
      const VerificationMeta('registerName');
  @override
  late final GeneratedColumn<String> registerName = GeneratedColumn<String>(
      'register_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _registerSerialNoMeta =
      const VerificationMeta('registerSerialNo');
  @override
  late final GeneratedColumn<String> registerSerialNo = GeneratedColumn<String>(
      'register_serial_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
      'branch_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _branchNameMeta =
      const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String> branchName = GeneratedColumn<String>(
      'branch_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receiptConfigMeta =
      const VerificationMeta('receiptConfig');
  @override
  late final GeneratedColumn<String> receiptConfig = GeneratedColumn<String>(
      'receipt_config', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _printerMeta =
      const VerificationMeta('printer');
  @override
  late final GeneratedColumn<String> printer = GeneratedColumn<String>(
      'printer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        registerId,
        registerName,
        registerSerialNo,
        branchId,
        branchName,
        receiptConfig,
        printer
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('register_id')) {
      context.handle(
          _registerIdMeta,
          registerId.isAcceptableOrUnknown(
              data['register_id']!, _registerIdMeta));
    }
    if (data.containsKey('register_name')) {
      context.handle(
          _registerNameMeta,
          registerName.isAcceptableOrUnknown(
              data['register_name']!, _registerNameMeta));
    }
    if (data.containsKey('register_serial_no')) {
      context.handle(
          _registerSerialNoMeta,
          registerSerialNo.isAcceptableOrUnknown(
              data['register_serial_no']!, _registerSerialNoMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('receipt_config')) {
      context.handle(
          _receiptConfigMeta,
          receiptConfig.isAcceptableOrUnknown(
              data['receipt_config']!, _receiptConfigMeta));
    }
    if (data.containsKey('printer')) {
      context.handle(_printerMeta,
          printer.isAcceptableOrUnknown(data['printer']!, _printerMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      registerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}register_id']),
      registerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}register_name']),
      registerSerialNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}register_serial_no']),
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}branch_id']),
      branchName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_name']),
      receiptConfig: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}receipt_config']),
      printer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}printer']),
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class SettingsModel extends DataClass implements Insertable<SettingsModel> {
  final int id;
  final int? registerId;
  final String? registerName;
  final String? registerSerialNo;
  final int? branchId;
  final String? branchName;
  final String? receiptConfig;
  final String? printer;
  const SettingsModel(
      {required this.id,
      this.registerId,
      this.registerName,
      this.registerSerialNo,
      this.branchId,
      this.branchName,
      this.receiptConfig,
      this.printer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || registerId != null) {
      map['register_id'] = Variable<int>(registerId);
    }
    if (!nullToAbsent || registerName != null) {
      map['register_name'] = Variable<String>(registerName);
    }
    if (!nullToAbsent || registerSerialNo != null) {
      map['register_serial_no'] = Variable<String>(registerSerialNo);
    }
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<int>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    if (!nullToAbsent || receiptConfig != null) {
      map['receipt_config'] = Variable<String>(receiptConfig);
    }
    if (!nullToAbsent || printer != null) {
      map['printer'] = Variable<String>(printer);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: Value(id),
      registerId: registerId == null && nullToAbsent
          ? const Value.absent()
          : Value(registerId),
      registerName: registerName == null && nullToAbsent
          ? const Value.absent()
          : Value(registerName),
      registerSerialNo: registerSerialNo == null && nullToAbsent
          ? const Value.absent()
          : Value(registerSerialNo),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      receiptConfig: receiptConfig == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptConfig),
      printer: printer == null && nullToAbsent
          ? const Value.absent()
          : Value(printer),
    );
  }

  factory SettingsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsModel(
      id: serializer.fromJson<int>(json['id']),
      registerId: serializer.fromJson<int?>(json['registerId']),
      registerName: serializer.fromJson<String?>(json['registerName']),
      registerSerialNo: serializer.fromJson<String?>(json['registerSerialNo']),
      branchId: serializer.fromJson<int?>(json['branchId']),
      branchName: serializer.fromJson<String?>(json['branchName']),
      receiptConfig: serializer.fromJson<String?>(json['receiptConfig']),
      printer: serializer.fromJson<String?>(json['printer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'registerId': serializer.toJson<int?>(registerId),
      'registerName': serializer.toJson<String?>(registerName),
      'registerSerialNo': serializer.toJson<String?>(registerSerialNo),
      'branchId': serializer.toJson<int?>(branchId),
      'branchName': serializer.toJson<String?>(branchName),
      'receiptConfig': serializer.toJson<String?>(receiptConfig),
      'printer': serializer.toJson<String?>(printer),
    };
  }

  SettingsModel copyWith(
          {int? id,
          Value<int?> registerId = const Value.absent(),
          Value<String?> registerName = const Value.absent(),
          Value<String?> registerSerialNo = const Value.absent(),
          Value<int?> branchId = const Value.absent(),
          Value<String?> branchName = const Value.absent(),
          Value<String?> receiptConfig = const Value.absent(),
          Value<String?> printer = const Value.absent()}) =>
      SettingsModel(
        id: id ?? this.id,
        registerId: registerId.present ? registerId.value : this.registerId,
        registerName:
            registerName.present ? registerName.value : this.registerName,
        registerSerialNo: registerSerialNo.present
            ? registerSerialNo.value
            : this.registerSerialNo,
        branchId: branchId.present ? branchId.value : this.branchId,
        branchName: branchName.present ? branchName.value : this.branchName,
        receiptConfig:
            receiptConfig.present ? receiptConfig.value : this.receiptConfig,
        printer: printer.present ? printer.value : this.printer,
      );
  @override
  String toString() {
    return (StringBuffer('SettingsModel(')
          ..write('id: $id, ')
          ..write('registerId: $registerId, ')
          ..write('registerName: $registerName, ')
          ..write('registerSerialNo: $registerSerialNo, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('receiptConfig: $receiptConfig, ')
          ..write('printer: $printer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, registerId, registerName,
      registerSerialNo, branchId, branchName, receiptConfig, printer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsModel &&
          other.id == this.id &&
          other.registerId == this.registerId &&
          other.registerName == this.registerName &&
          other.registerSerialNo == this.registerSerialNo &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.receiptConfig == this.receiptConfig &&
          other.printer == this.printer);
}

class SettingsCompanion extends UpdateCompanion<SettingsModel> {
  final Value<int> id;
  final Value<int?> registerId;
  final Value<String?> registerName;
  final Value<String?> registerSerialNo;
  final Value<int?> branchId;
  final Value<String?> branchName;
  final Value<String?> receiptConfig;
  final Value<String?> printer;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.registerId = const Value.absent(),
    this.registerName = const Value.absent(),
    this.registerSerialNo = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.receiptConfig = const Value.absent(),
    this.printer = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    this.registerId = const Value.absent(),
    this.registerName = const Value.absent(),
    this.registerSerialNo = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.receiptConfig = const Value.absent(),
    this.printer = const Value.absent(),
  });
  static Insertable<SettingsModel> custom({
    Expression<int>? id,
    Expression<int>? registerId,
    Expression<String>? registerName,
    Expression<String>? registerSerialNo,
    Expression<int>? branchId,
    Expression<String>? branchName,
    Expression<String>? receiptConfig,
    Expression<String>? printer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registerId != null) 'register_id': registerId,
      if (registerName != null) 'register_name': registerName,
      if (registerSerialNo != null) 'register_serial_no': registerSerialNo,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (receiptConfig != null) 'receipt_config': receiptConfig,
      if (printer != null) 'printer': printer,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? registerId,
      Value<String?>? registerName,
      Value<String?>? registerSerialNo,
      Value<int?>? branchId,
      Value<String?>? branchName,
      Value<String?>? receiptConfig,
      Value<String?>? printer}) {
    return SettingsCompanion(
      id: id ?? this.id,
      registerId: registerId ?? this.registerId,
      registerName: registerName ?? this.registerName,
      registerSerialNo: registerSerialNo ?? this.registerSerialNo,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      receiptConfig: receiptConfig ?? this.receiptConfig,
      printer: printer ?? this.printer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (registerId.present) {
      map['register_id'] = Variable<int>(registerId.value);
    }
    if (registerName.present) {
      map['register_name'] = Variable<String>(registerName.value);
    }
    if (registerSerialNo.present) {
      map['register_serial_no'] = Variable<String>(registerSerialNo.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (receiptConfig.present) {
      map['receipt_config'] = Variable<String>(receiptConfig.value);
    }
    if (printer.present) {
      map['printer'] = Variable<String>(printer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('registerId: $registerId, ')
          ..write('registerName: $registerName, ')
          ..write('registerSerialNo: $registerSerialNo, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('receiptConfig: $receiptConfig, ')
          ..write('printer: $printer')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $SessionTable session = $SessionTable(this);
  late final $RegisterShiftsTable registerShifts = $RegisterShiftsTable(this);
  late final $ProductCatalogTable productCatalog = $ProductCatalogTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $TransactionItemsTable transactionItems =
      $TransactionItemsTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final SessionDao sessionDao = SessionDao(this as AppDatabase);
  late final RegisterShiftDao registerShiftDao =
      RegisterShiftDao(this as AppDatabase);
  late final ProductCatalogDao productCatalogDao =
      ProductCatalogDao(this as AppDatabase);
  late final TransactionDao transactionDao =
      TransactionDao(this as AppDatabase);
  late final SyncQueueDao syncQueueDao = SyncQueueDao(this as AppDatabase);
  late final SyncMetadataDao syncMetadataDao =
      SyncMetadataDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        session,
        registerShifts,
        productCatalog,
        transactions,
        transactionItems,
        syncQueue,
        syncMetadata,
        settings
      ];
}
