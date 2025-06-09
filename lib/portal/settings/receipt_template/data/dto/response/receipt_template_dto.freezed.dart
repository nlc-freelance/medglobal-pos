// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptTemplateDto _$ReceiptTemplateDtoFromJson(Map<String, dynamic> json) {
  return _ReceiptTemplateDto.fromJson(json);
}

/// @nodoc
mixin _$ReceiptTemplateDto {
  int get id => throw _privateConstructorUsedError;
  int get accountId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isSystemDefault => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  bool get showCompanyName => throw _privateConstructorUsedError;
  bool get showBranchName => throw _privateConstructorUsedError;
  bool get showBranchAddress => throw _privateConstructorUsedError;
  bool get showBranchContact => throw _privateConstructorUsedError;
  bool get showFooterMessage => throw _privateConstructorUsedError;
  String? get footerTitle => throw _privateConstructorUsedError;
  String? get footerMessage => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptTemplateDtoCopyWith<ReceiptTemplateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptTemplateDtoCopyWith<$Res> {
  factory $ReceiptTemplateDtoCopyWith(
          ReceiptTemplateDto value, $Res Function(ReceiptTemplateDto) then) =
      _$ReceiptTemplateDtoCopyWithImpl<$Res, ReceiptTemplateDto>;
  @useResult
  $Res call(
      {int id,
      int accountId,
      String name,
      String? description,
      bool isSystemDefault,
      bool isDefault,
      bool showCompanyName,
      bool showBranchName,
      bool showBranchAddress,
      bool showBranchContact,
      bool showFooterMessage,
      String? footerTitle,
      String? footerMessage,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$ReceiptTemplateDtoCopyWithImpl<$Res, $Val extends ReceiptTemplateDto>
    implements $ReceiptTemplateDtoCopyWith<$Res> {
  _$ReceiptTemplateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? description = freezed,
    Object? isSystemDefault = null,
    Object? isDefault = null,
    Object? showCompanyName = null,
    Object? showBranchName = null,
    Object? showBranchAddress = null,
    Object? showBranchContact = null,
    Object? showFooterMessage = null,
    Object? footerTitle = freezed,
    Object? footerMessage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemDefault: null == isSystemDefault
          ? _value.isSystemDefault
          : isSystemDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      showCompanyName: null == showCompanyName
          ? _value.showCompanyName
          : showCompanyName // ignore: cast_nullable_to_non_nullable
              as bool,
      showBranchName: null == showBranchName
          ? _value.showBranchName
          : showBranchName // ignore: cast_nullable_to_non_nullable
              as bool,
      showBranchAddress: null == showBranchAddress
          ? _value.showBranchAddress
          : showBranchAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      showBranchContact: null == showBranchContact
          ? _value.showBranchContact
          : showBranchContact // ignore: cast_nullable_to_non_nullable
              as bool,
      showFooterMessage: null == showFooterMessage
          ? _value.showFooterMessage
          : showFooterMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      footerTitle: freezed == footerTitle
          ? _value.footerTitle
          : footerTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      footerMessage: freezed == footerMessage
          ? _value.footerMessage
          : footerMessage // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ReceiptTemplateDtoImplCopyWith<$Res>
    implements $ReceiptTemplateDtoCopyWith<$Res> {
  factory _$$ReceiptTemplateDtoImplCopyWith(_$ReceiptTemplateDtoImpl value,
          $Res Function(_$ReceiptTemplateDtoImpl) then) =
      __$$ReceiptTemplateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int accountId,
      String name,
      String? description,
      bool isSystemDefault,
      bool isDefault,
      bool showCompanyName,
      bool showBranchName,
      bool showBranchAddress,
      bool showBranchContact,
      bool showFooterMessage,
      String? footerTitle,
      String? footerMessage,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$ReceiptTemplateDtoImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateDtoCopyWithImpl<$Res, _$ReceiptTemplateDtoImpl>
    implements _$$ReceiptTemplateDtoImplCopyWith<$Res> {
  __$$ReceiptTemplateDtoImplCopyWithImpl(_$ReceiptTemplateDtoImpl _value,
      $Res Function(_$ReceiptTemplateDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? description = freezed,
    Object? isSystemDefault = null,
    Object? isDefault = null,
    Object? showCompanyName = null,
    Object? showBranchName = null,
    Object? showBranchAddress = null,
    Object? showBranchContact = null,
    Object? showFooterMessage = null,
    Object? footerTitle = freezed,
    Object? footerMessage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReceiptTemplateDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemDefault: null == isSystemDefault
          ? _value.isSystemDefault
          : isSystemDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      showCompanyName: null == showCompanyName
          ? _value.showCompanyName
          : showCompanyName // ignore: cast_nullable_to_non_nullable
              as bool,
      showBranchName: null == showBranchName
          ? _value.showBranchName
          : showBranchName // ignore: cast_nullable_to_non_nullable
              as bool,
      showBranchAddress: null == showBranchAddress
          ? _value.showBranchAddress
          : showBranchAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      showBranchContact: null == showBranchContact
          ? _value.showBranchContact
          : showBranchContact // ignore: cast_nullable_to_non_nullable
              as bool,
      showFooterMessage: null == showFooterMessage
          ? _value.showFooterMessage
          : showFooterMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      footerTitle: freezed == footerTitle
          ? _value.footerTitle
          : footerTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      footerMessage: freezed == footerMessage
          ? _value.footerMessage
          : footerMessage // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ReceiptTemplateDtoImpl extends _ReceiptTemplateDto {
  const _$ReceiptTemplateDtoImpl(
      {required this.id,
      required this.accountId,
      required this.name,
      this.description,
      this.isSystemDefault = false,
      this.isDefault = false,
      this.showCompanyName = false,
      this.showBranchName = false,
      this.showBranchAddress = false,
      this.showBranchContact = false,
      this.showFooterMessage = false,
      this.footerTitle,
      this.footerMessage,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : super._();

  factory _$ReceiptTemplateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptTemplateDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int accountId;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isSystemDefault;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey()
  final bool showCompanyName;
  @override
  @JsonKey()
  final bool showBranchName;
  @override
  @JsonKey()
  final bool showBranchAddress;
  @override
  @JsonKey()
  final bool showBranchContact;
  @override
  @JsonKey()
  final bool showFooterMessage;
  @override
  final String? footerTitle;
  @override
  final String? footerMessage;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ReceiptTemplateDto(id: $id, accountId: $accountId, name: $name, description: $description, isSystemDefault: $isSystemDefault, isDefault: $isDefault, showCompanyName: $showCompanyName, showBranchName: $showBranchName, showBranchAddress: $showBranchAddress, showBranchContact: $showBranchContact, showFooterMessage: $showFooterMessage, footerTitle: $footerTitle, footerMessage: $footerMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptTemplateDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isSystemDefault, isSystemDefault) ||
                other.isSystemDefault == isSystemDefault) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.showCompanyName, showCompanyName) ||
                other.showCompanyName == showCompanyName) &&
            (identical(other.showBranchName, showBranchName) ||
                other.showBranchName == showBranchName) &&
            (identical(other.showBranchAddress, showBranchAddress) ||
                other.showBranchAddress == showBranchAddress) &&
            (identical(other.showBranchContact, showBranchContact) ||
                other.showBranchContact == showBranchContact) &&
            (identical(other.showFooterMessage, showFooterMessage) ||
                other.showFooterMessage == showFooterMessage) &&
            (identical(other.footerTitle, footerTitle) ||
                other.footerTitle == footerTitle) &&
            (identical(other.footerMessage, footerMessage) ||
                other.footerMessage == footerMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountId,
      name,
      description,
      isSystemDefault,
      isDefault,
      showCompanyName,
      showBranchName,
      showBranchAddress,
      showBranchContact,
      showFooterMessage,
      footerTitle,
      footerMessage,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptTemplateDtoImplCopyWith<_$ReceiptTemplateDtoImpl> get copyWith =>
      __$$ReceiptTemplateDtoImplCopyWithImpl<_$ReceiptTemplateDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptTemplateDtoImplToJson(
      this,
    );
  }
}

abstract class _ReceiptTemplateDto extends ReceiptTemplateDto {
  const factory _ReceiptTemplateDto(
          {required final int id,
          required final int accountId,
          required final String name,
          final String? description,
          final bool isSystemDefault,
          final bool isDefault,
          final bool showCompanyName,
          final bool showBranchName,
          final bool showBranchAddress,
          final bool showBranchContact,
          final bool showFooterMessage,
          final String? footerTitle,
          final String? footerMessage,
          @DateTimeConverter() final DateTime? createdAt,
          @DateTimeConverter() final DateTime? updatedAt}) =
      _$ReceiptTemplateDtoImpl;
  const _ReceiptTemplateDto._() : super._();

  factory _ReceiptTemplateDto.fromJson(Map<String, dynamic> json) =
      _$ReceiptTemplateDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get accountId;
  @override
  String get name;
  @override
  String? get description;
  @override
  bool get isSystemDefault;
  @override
  bool get isDefault;
  @override
  bool get showCompanyName;
  @override
  bool get showBranchName;
  @override
  bool get showBranchAddress;
  @override
  bool get showBranchContact;
  @override
  bool get showFooterMessage;
  @override
  String? get footerTitle;
  @override
  String? get footerMessage;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptTemplateDtoImplCopyWith<_$ReceiptTemplateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
