// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return _ProductDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get productImageUrl => throw _privateConstructorUsedError;
  CategoryDto? get category => throw _privateConstructorUsedError;
  List<VariantDto> get variants => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDtoCopyWith<ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res, ProductDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? productImageUrl,
      CategoryDto? category,
      List<VariantDto> variants,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res, $Val extends ProductDto>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? productImageUrl = freezed,
    Object? category = freezed,
    Object? variants = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: freezed == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDto?,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantDto>,
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
abstract class _$$ProductDtoImplCopyWith<$Res>
    implements $ProductDtoCopyWith<$Res> {
  factory _$$ProductDtoImplCopyWith(
          _$ProductDtoImpl value, $Res Function(_$ProductDtoImpl) then) =
      __$$ProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? productImageUrl,
      CategoryDto? category,
      List<VariantDto> variants,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$ProductDtoImplCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$ProductDtoImpl>
    implements _$$ProductDtoImplCopyWith<$Res> {
  __$$ProductDtoImplCopyWithImpl(
      _$ProductDtoImpl _value, $Res Function(_$ProductDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? productImageUrl = freezed,
    Object? category = freezed,
    Object? variants = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: freezed == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryDto?,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantDto>,
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
class _$ProductDtoImpl extends _ProductDto {
  const _$ProductDtoImpl(
      {required this.id,
      required this.name,
      this.productImageUrl,
      this.category,
      required final List<VariantDto> variants,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : _variants = variants,
        super._();

  factory _$ProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? productImageUrl;
  @override
  final CategoryDto? category;
  final List<VariantDto> _variants;
  @override
  List<VariantDto> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ProductDto(id: $id, name: $name, productImageUrl: $productImageUrl, category: $category, variants: $variants, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
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
      name,
      productImageUrl,
      category,
      const DeepCollectionEquality().hash(_variants),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDtoImplCopyWith<_$ProductDtoImpl> get copyWith =>
      __$$ProductDtoImplCopyWithImpl<_$ProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductDto extends ProductDto {
  const factory _ProductDto(
      {required final int id,
      required final String name,
      final String? productImageUrl,
      final CategoryDto? category,
      required final List<VariantDto> variants,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$ProductDtoImpl;
  const _ProductDto._() : super._();

  factory _ProductDto.fromJson(Map<String, dynamic> json) =
      _$ProductDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get productImageUrl;
  @override
  CategoryDto? get category;
  @override
  List<VariantDto> get variants;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductDtoImplCopyWith<_$ProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductLiteDto _$ProductLiteDtoFromJson(Map<String, dynamic> json) {
  return _ProductLiteDto.fromJson(json);
}

/// @nodoc
mixin _$ProductLiteDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductLiteDtoCopyWith<ProductLiteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductLiteDtoCopyWith<$Res> {
  factory $ProductLiteDtoCopyWith(
          ProductLiteDto value, $Res Function(ProductLiteDto) then) =
      _$ProductLiteDtoCopyWithImpl<$Res, ProductLiteDto>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ProductLiteDtoCopyWithImpl<$Res, $Val extends ProductLiteDto>
    implements $ProductLiteDtoCopyWith<$Res> {
  _$ProductLiteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductLiteDtoImplCopyWith<$Res>
    implements $ProductLiteDtoCopyWith<$Res> {
  factory _$$ProductLiteDtoImplCopyWith(_$ProductLiteDtoImpl value,
          $Res Function(_$ProductLiteDtoImpl) then) =
      __$$ProductLiteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$ProductLiteDtoImplCopyWithImpl<$Res>
    extends _$ProductLiteDtoCopyWithImpl<$Res, _$ProductLiteDtoImpl>
    implements _$$ProductLiteDtoImplCopyWith<$Res> {
  __$$ProductLiteDtoImplCopyWithImpl(
      _$ProductLiteDtoImpl _value, $Res Function(_$ProductLiteDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ProductLiteDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductLiteDtoImpl extends _ProductLiteDto {
  const _$ProductLiteDtoImpl({required this.id, required this.name})
      : super._();

  factory _$ProductLiteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductLiteDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ProductLiteDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLiteDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLiteDtoImplCopyWith<_$ProductLiteDtoImpl> get copyWith =>
      __$$ProductLiteDtoImplCopyWithImpl<_$ProductLiteDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductLiteDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductLiteDto extends ProductLiteDto {
  const factory _ProductLiteDto(
      {required final int id,
      required final String name}) = _$ProductLiteDtoImpl;
  const _ProductLiteDto._() : super._();

  factory _ProductLiteDto.fromJson(Map<String, dynamic> json) =
      _$ProductLiteDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ProductLiteDtoImplCopyWith<_$ProductLiteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
