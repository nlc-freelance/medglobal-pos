// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportDto _$ReportDtoFromJson(Map<String, dynamic> json) {
  return _ReportDto.fromJson(json);
}

/// @nodoc
mixin _$ReportDto {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDtoCopyWith<ReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDtoCopyWith<$Res> {
  factory $ReportDtoCopyWith(ReportDto value, $Res Function(ReportDto) then) =
      _$ReportDtoCopyWithImpl<$Res, ReportDto>;
  @useResult
  $Res call(
      {int id,
      String type,
      String status,
      String? fileUrl,
      String fileName,
      int? userId,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$ReportDtoCopyWithImpl<$Res, $Val extends ReportDto>
    implements $ReportDtoCopyWith<$Res> {
  _$ReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? fileUrl = freezed,
    Object? fileName = null,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDtoImplCopyWith<$Res>
    implements $ReportDtoCopyWith<$Res> {
  factory _$$ReportDtoImplCopyWith(
          _$ReportDtoImpl value, $Res Function(_$ReportDtoImpl) then) =
      __$$ReportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String type,
      String status,
      String? fileUrl,
      String fileName,
      int? userId,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$ReportDtoImplCopyWithImpl<$Res>
    extends _$ReportDtoCopyWithImpl<$Res, _$ReportDtoImpl>
    implements _$$ReportDtoImplCopyWith<$Res> {
  __$$ReportDtoImplCopyWithImpl(
      _$ReportDtoImpl _value, $Res Function(_$ReportDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? fileUrl = freezed,
    Object? fileName = null,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReportDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDtoImpl implements _ReportDto {
  const _$ReportDtoImpl(
      {required this.id,
      required this.type,
      required this.status,
      this.fileUrl,
      required this.fileName,
      this.userId,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt});

  factory _$ReportDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String status;
  @override
  final String? fileUrl;
  @override
  final String fileName;
  @override
  final int? userId;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ReportDto(id: $id, type: $type, status: $status, fileUrl: $fileUrl, fileName: $fileName, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, status, fileUrl,
      fileName, userId, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDtoImplCopyWith<_$ReportDtoImpl> get copyWith =>
      __$$ReportDtoImplCopyWithImpl<_$ReportDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDtoImplToJson(
      this,
    );
  }
}

abstract class _ReportDto implements ReportDto {
  const factory _ReportDto(
      {required final int id,
      required final String type,
      required final String status,
      final String? fileUrl,
      required final String fileName,
      final int? userId,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$ReportDtoImpl;

  factory _ReportDto.fromJson(Map<String, dynamic> json) =
      _$ReportDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get status;
  @override
  String? get fileUrl;
  @override
  String get fileName;
  @override
  int? get userId;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReportDtoImplCopyWith<_$ReportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
