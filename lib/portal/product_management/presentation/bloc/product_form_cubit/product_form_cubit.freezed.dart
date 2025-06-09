// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductFormState {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<VariantFormModel> get variants => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductFormStateCopyWith<ProductFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormStateCopyWith<$Res> {
  factory $ProductFormStateCopyWith(
          ProductFormState value, $Res Function(ProductFormState) then) =
      _$ProductFormStateCopyWithImpl<$Res, ProductFormState>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      Category? category,
      String? imageUrl,
      List<VariantFormModel> variants});
}

/// @nodoc
class _$ProductFormStateCopyWithImpl<$Res, $Val extends ProductFormState>
    implements $ProductFormStateCopyWith<$Res> {
  _$ProductFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
    Object? variants = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantFormModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFormStateImplCopyWith<$Res>
    implements $ProductFormStateCopyWith<$Res> {
  factory _$$ProductFormStateImplCopyWith(_$ProductFormStateImpl value,
          $Res Function(_$ProductFormStateImpl) then) =
      __$$ProductFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      Category? category,
      String? imageUrl,
      List<VariantFormModel> variants});
}

/// @nodoc
class __$$ProductFormStateImplCopyWithImpl<$Res>
    extends _$ProductFormStateCopyWithImpl<$Res, _$ProductFormStateImpl>
    implements _$$ProductFormStateImplCopyWith<$Res> {
  __$$ProductFormStateImplCopyWithImpl(_$ProductFormStateImpl _value,
      $Res Function(_$ProductFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
    Object? variants = null,
  }) {
    return _then(_$ProductFormStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<VariantFormModel>,
    ));
  }
}

/// @nodoc

class _$ProductFormStateImpl extends _ProductFormState {
  const _$ProductFormStateImpl(
      {this.id,
      this.name,
      this.category,
      this.imageUrl,
      required final List<VariantFormModel> variants})
      : _variants = variants,
        super._();

  @override
  final int? id;
  @override
  final String? name;
  @override
  final Category? category;
  @override
  final String? imageUrl;
  final List<VariantFormModel> _variants;
  @override
  List<VariantFormModel> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  String toString() {
    return 'ProductFormState(id: $id, name: $name, category: $category, imageUrl: $imageUrl, variants: $variants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFormStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._variants, _variants));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, category, imageUrl,
      const DeepCollectionEquality().hash(_variants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFormStateImplCopyWith<_$ProductFormStateImpl> get copyWith =>
      __$$ProductFormStateImplCopyWithImpl<_$ProductFormStateImpl>(
          this, _$identity);
}

abstract class _ProductFormState extends ProductFormState {
  const factory _ProductFormState(
      {final int? id,
      final String? name,
      final Category? category,
      final String? imageUrl,
      required final List<VariantFormModel> variants}) = _$ProductFormStateImpl;
  const _ProductFormState._() : super._();

  @override
  int? get id;
  @override
  String? get name;
  @override
  Category? get category;
  @override
  String? get imageUrl;
  @override
  List<VariantFormModel> get variants;
  @override
  @JsonKey(ignore: true)
  _$$ProductFormStateImplCopyWith<_$ProductFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
