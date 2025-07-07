// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductABCParams {
  Branch? get branch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductABCParamsCopyWith<ProductABCParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductABCParamsCopyWith<$Res> {
  factory $ProductABCParamsCopyWith(
          ProductABCParams value, $Res Function(ProductABCParams) then) =
      _$ProductABCParamsCopyWithImpl<$Res, ProductABCParams>;
  @useResult
  $Res call({Branch? branch});

  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$ProductABCParamsCopyWithImpl<$Res, $Val extends ProductABCParams>
    implements $ProductABCParamsCopyWith<$Res> {
  _$ProductABCParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = freezed,
  }) {
    return _then(_value.copyWith(
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $BranchCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductABCParamsImplCopyWith<$Res>
    implements $ProductABCParamsCopyWith<$Res> {
  factory _$$ProductABCParamsImplCopyWith(_$ProductABCParamsImpl value,
          $Res Function(_$ProductABCParamsImpl) then) =
      __$$ProductABCParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Branch? branch});

  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$ProductABCParamsImplCopyWithImpl<$Res>
    extends _$ProductABCParamsCopyWithImpl<$Res, _$ProductABCParamsImpl>
    implements _$$ProductABCParamsImplCopyWith<$Res> {
  __$$ProductABCParamsImplCopyWithImpl(_$ProductABCParamsImpl _value,
      $Res Function(_$ProductABCParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = freezed,
  }) {
    return _then(_$ProductABCParamsImpl(
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
    ));
  }
}

/// @nodoc

class _$ProductABCParamsImpl implements _ProductABCParams {
  const _$ProductABCParamsImpl({this.branch});

  @override
  final Branch? branch;

  @override
  String toString() {
    return 'ProductABCParams(branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductABCParamsImpl &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductABCParamsImplCopyWith<_$ProductABCParamsImpl> get copyWith =>
      __$$ProductABCParamsImplCopyWithImpl<_$ProductABCParamsImpl>(
          this, _$identity);
}

abstract class _ProductABCParams implements ProductABCParams {
  const factory _ProductABCParams({final Branch? branch}) =
      _$ProductABCParamsImpl;

  @override
  Branch? get branch;
  @override
  @JsonKey(ignore: true)
  _$$ProductABCParamsImplCopyWith<_$ProductABCParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductPNLParams {
  List<Category>? get categories => throw _privateConstructorUsedError;
  int? get topN => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductPNLParamsCopyWith<ProductPNLParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPNLParamsCopyWith<$Res> {
  factory $ProductPNLParamsCopyWith(
          ProductPNLParams value, $Res Function(ProductPNLParams) then) =
      _$ProductPNLParamsCopyWithImpl<$Res, ProductPNLParams>;
  @useResult
  $Res call({List<Category>? categories, int? topN});
}

/// @nodoc
class _$ProductPNLParamsCopyWithImpl<$Res, $Val extends ProductPNLParams>
    implements $ProductPNLParamsCopyWith<$Res> {
  _$ProductPNLParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? topN = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      topN: freezed == topN
          ? _value.topN
          : topN // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPNLParamsImplCopyWith<$Res>
    implements $ProductPNLParamsCopyWith<$Res> {
  factory _$$ProductPNLParamsImplCopyWith(_$ProductPNLParamsImpl value,
          $Res Function(_$ProductPNLParamsImpl) then) =
      __$$ProductPNLParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category>? categories, int? topN});
}

/// @nodoc
class __$$ProductPNLParamsImplCopyWithImpl<$Res>
    extends _$ProductPNLParamsCopyWithImpl<$Res, _$ProductPNLParamsImpl>
    implements _$$ProductPNLParamsImplCopyWith<$Res> {
  __$$ProductPNLParamsImplCopyWithImpl(_$ProductPNLParamsImpl _value,
      $Res Function(_$ProductPNLParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
    Object? topN = freezed,
  }) {
    return _then(_$ProductPNLParamsImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      topN: freezed == topN
          ? _value.topN
          : topN // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ProductPNLParamsImpl implements _ProductPNLParams {
  const _$ProductPNLParamsImpl({final List<Category>? categories, this.topN})
      : _categories = categories;

  final List<Category>? _categories;
  @override
  List<Category>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? topN;

  @override
  String toString() {
    return 'ProductPNLParams(categories: $categories, topN: $topN)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPNLParamsImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.topN, topN) || other.topN == topN));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories), topN);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPNLParamsImplCopyWith<_$ProductPNLParamsImpl> get copyWith =>
      __$$ProductPNLParamsImplCopyWithImpl<_$ProductPNLParamsImpl>(
          this, _$identity);
}

abstract class _ProductPNLParams implements ProductPNLParams {
  const factory _ProductPNLParams(
      {final List<Category>? categories,
      final int? topN}) = _$ProductPNLParamsImpl;

  @override
  List<Category>? get categories;
  @override
  int? get topN;
  @override
  @JsonKey(ignore: true)
  _$$ProductPNLParamsImplCopyWith<_$ProductPNLParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
