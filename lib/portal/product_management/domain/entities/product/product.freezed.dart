// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Product {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  List<Variant> get variants => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? imageUrl,
      Category? category,
      List<Variant> variants,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? category = freezed,
    Object? variants = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
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
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? imageUrl,
      Category? category,
      List<Variant> variants,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? category = freezed,
    Object? variants = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
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

class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {this.id,
      required this.name,
      this.imageUrl,
      this.category,
      required final List<Variant> variants,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt})
      : _variants = variants,
        super._();

  @override
  final int? id;
  @override
  final String name;
  @override
  final String? imageUrl;
  @override
  final Category? category;
  final List<Variant> _variants;
  @override
  List<Variant> get variants {
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
    return 'Product(id: $id, name: $name, imageUrl: $imageUrl, category: $category, variants: $variants, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, category,
      const DeepCollectionEquality().hash(_variants), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);
}

abstract class _Product extends Product {
  const factory _Product(
      {final int? id,
      required final String name,
      final String? imageUrl,
      final Category? category,
      required final List<Variant> variants,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$ProductImpl;
  const _Product._() : super._();

  @override
  int? get id;
  @override
  String get name;
  @override
  String? get imageUrl;
  @override
  Category? get category;
  @override
  List<Variant> get variants;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductLite {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductLiteCopyWith<ProductLite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductLiteCopyWith<$Res> {
  factory $ProductLiteCopyWith(
          ProductLite value, $Res Function(ProductLite) then) =
      _$ProductLiteCopyWithImpl<$Res, ProductLite>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ProductLiteCopyWithImpl<$Res, $Val extends ProductLite>
    implements $ProductLiteCopyWith<$Res> {
  _$ProductLiteCopyWithImpl(this._value, this._then);

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
abstract class _$$ProductLiteImplCopyWith<$Res>
    implements $ProductLiteCopyWith<$Res> {
  factory _$$ProductLiteImplCopyWith(
          _$ProductLiteImpl value, $Res Function(_$ProductLiteImpl) then) =
      __$$ProductLiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$ProductLiteImplCopyWithImpl<$Res>
    extends _$ProductLiteCopyWithImpl<$Res, _$ProductLiteImpl>
    implements _$$ProductLiteImplCopyWith<$Res> {
  __$$ProductLiteImplCopyWithImpl(
      _$ProductLiteImpl _value, $Res Function(_$ProductLiteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ProductLiteImpl(
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

class _$ProductLiteImpl implements _ProductLite {
  const _$ProductLiteImpl({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ProductLite(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLiteImplCopyWith<_$ProductLiteImpl> get copyWith =>
      __$$ProductLiteImplCopyWithImpl<_$ProductLiteImpl>(this, _$identity);
}

abstract class _ProductLite implements ProductLite {
  const factory _ProductLite(
      {required final int id, required final String name}) = _$ProductLiteImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ProductLiteImplCopyWith<_$ProductLiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
