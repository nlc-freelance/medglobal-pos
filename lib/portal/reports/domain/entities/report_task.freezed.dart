// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportTask {
  int get id => throw _privateConstructorUsedError; // Report id
  String get key =>
      throw _privateConstructorUsedError; // Used for lookup <id>-<type>
  ReportType get type => throw _privateConstructorUsedError;
  ReportTaskStatus get status => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Timer? get pollingTimer => throw _privateConstructorUsedError;
  dynamic get fromRemoteDB => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportTaskCopyWith<ReportTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTaskCopyWith<$Res> {
  factory $ReportTaskCopyWith(
          ReportTask value, $Res Function(ReportTask) then) =
      _$ReportTaskCopyWithImpl<$Res, ReportTask>;
  @useResult
  $Res call(
      {int id,
      String key,
      ReportType type,
      ReportTaskStatus status,
      String fileName,
      String? fileUrl,
      String? error,
      Timer? pollingTimer,
      dynamic fromRemoteDB});
}

/// @nodoc
class _$ReportTaskCopyWithImpl<$Res, $Val extends ReportTask>
    implements $ReportTaskCopyWith<$Res> {
  _$ReportTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? type = null,
    Object? status = null,
    Object? fileName = null,
    Object? fileUrl = freezed,
    Object? error = freezed,
    Object? pollingTimer = freezed,
    Object? fromRemoteDB = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportTaskStatus,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      pollingTimer: freezed == pollingTimer
          ? _value.pollingTimer
          : pollingTimer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      fromRemoteDB: freezed == fromRemoteDB
          ? _value.fromRemoteDB
          : fromRemoteDB // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportTaskImplCopyWith<$Res>
    implements $ReportTaskCopyWith<$Res> {
  factory _$$ReportTaskImplCopyWith(
          _$ReportTaskImpl value, $Res Function(_$ReportTaskImpl) then) =
      __$$ReportTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String key,
      ReportType type,
      ReportTaskStatus status,
      String fileName,
      String? fileUrl,
      String? error,
      Timer? pollingTimer,
      dynamic fromRemoteDB});
}

/// @nodoc
class __$$ReportTaskImplCopyWithImpl<$Res>
    extends _$ReportTaskCopyWithImpl<$Res, _$ReportTaskImpl>
    implements _$$ReportTaskImplCopyWith<$Res> {
  __$$ReportTaskImplCopyWithImpl(
      _$ReportTaskImpl _value, $Res Function(_$ReportTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? type = null,
    Object? status = null,
    Object? fileName = null,
    Object? fileUrl = freezed,
    Object? error = freezed,
    Object? pollingTimer = freezed,
    Object? fromRemoteDB = freezed,
  }) {
    return _then(_$ReportTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ReportType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportTaskStatus,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      pollingTimer: freezed == pollingTimer
          ? _value.pollingTimer
          : pollingTimer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      fromRemoteDB:
          freezed == fromRemoteDB ? _value.fromRemoteDB! : fromRemoteDB,
    ));
  }
}

/// @nodoc

class _$ReportTaskImpl implements _ReportTask {
  const _$ReportTaskImpl(
      {required this.id,
      required this.key,
      required this.type,
      required this.status,
      required this.fileName,
      this.fileUrl,
      this.error,
      this.pollingTimer,
      this.fromRemoteDB = false});

  @override
  final int id;
// Report id
  @override
  final String key;
// Used for lookup <id>-<type>
  @override
  final ReportType type;
  @override
  final ReportTaskStatus status;
  @override
  final String fileName;
  @override
  final String? fileUrl;
  @override
  final String? error;
  @override
  final Timer? pollingTimer;
  @override
  @JsonKey()
  final dynamic fromRemoteDB;

  @override
  String toString() {
    return 'ReportTask(id: $id, key: $key, type: $type, status: $status, fileName: $fileName, fileUrl: $fileUrl, error: $error, pollingTimer: $pollingTimer, fromRemoteDB: $fromRemoteDB)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.pollingTimer, pollingTimer) ||
                other.pollingTimer == pollingTimer) &&
            const DeepCollectionEquality()
                .equals(other.fromRemoteDB, fromRemoteDB));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      key,
      type,
      status,
      fileName,
      fileUrl,
      error,
      pollingTimer,
      const DeepCollectionEquality().hash(fromRemoteDB));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTaskImplCopyWith<_$ReportTaskImpl> get copyWith =>
      __$$ReportTaskImplCopyWithImpl<_$ReportTaskImpl>(this, _$identity);
}

abstract class _ReportTask implements ReportTask {
  const factory _ReportTask(
      {required final int id,
      required final String key,
      required final ReportType type,
      required final ReportTaskStatus status,
      required final String fileName,
      final String? fileUrl,
      final String? error,
      final Timer? pollingTimer,
      final dynamic fromRemoteDB}) = _$ReportTaskImpl;

  @override
  int get id;
  @override // Report id
  String get key;
  @override // Used for lookup <id>-<type>
  ReportType get type;
  @override
  ReportTaskStatus get status;
  @override
  String get fileName;
  @override
  String? get fileUrl;
  @override
  String? get error;
  @override
  Timer? get pollingTimer;
  @override
  dynamic get fromRemoteDB;
  @override
  @JsonKey(ignore: true)
  _$$ReportTaskImplCopyWith<_$ReportTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
