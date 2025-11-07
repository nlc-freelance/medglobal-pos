// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_list_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmployeeListFilterState {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeListFilterStateCopyWith<EmployeeListFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeListFilterStateCopyWith<$Res> {
  factory $EmployeeListFilterStateCopyWith(EmployeeListFilterState value,
          $Res Function(EmployeeListFilterState) then) =
      _$EmployeeListFilterStateCopyWithImpl<$Res, EmployeeListFilterState>;
  @useResult
  $Res call({int page, int size, String? search, String? role, int? branchId});
}

/// @nodoc
class _$EmployeeListFilterStateCopyWithImpl<$Res,
        $Val extends EmployeeListFilterState>
    implements $EmployeeListFilterStateCopyWith<$Res> {
  _$EmployeeListFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? search = freezed,
    Object? role = freezed,
    Object? branchId = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeListFilterStateImplCopyWith<$Res>
    implements $EmployeeListFilterStateCopyWith<$Res> {
  factory _$$EmployeeListFilterStateImplCopyWith(
          _$EmployeeListFilterStateImpl value,
          $Res Function(_$EmployeeListFilterStateImpl) then) =
      __$$EmployeeListFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int size, String? search, String? role, int? branchId});
}

/// @nodoc
class __$$EmployeeListFilterStateImplCopyWithImpl<$Res>
    extends _$EmployeeListFilterStateCopyWithImpl<$Res,
        _$EmployeeListFilterStateImpl>
    implements _$$EmployeeListFilterStateImplCopyWith<$Res> {
  __$$EmployeeListFilterStateImplCopyWithImpl(
      _$EmployeeListFilterStateImpl _value,
      $Res Function(_$EmployeeListFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? search = freezed,
    Object? role = freezed,
    Object? branchId = freezed,
  }) {
    return _then(_$EmployeeListFilterStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$EmployeeListFilterStateImpl implements _EmployeeListFilterState {
  const _$EmployeeListFilterStateImpl(
      {this.page = 1, this.size = 20, this.search, this.role, this.branchId});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  final String? search;
  @override
  final String? role;
  @override
  final int? branchId;

  @override
  String toString() {
    return 'EmployeeListFilterState(page: $page, size: $size, search: $search, role: $role, branchId: $branchId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeListFilterStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, size, search, role, branchId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeListFilterStateImplCopyWith<_$EmployeeListFilterStateImpl>
      get copyWith => __$$EmployeeListFilterStateImplCopyWithImpl<
          _$EmployeeListFilterStateImpl>(this, _$identity);
}

abstract class _EmployeeListFilterState implements EmployeeListFilterState {
  const factory _EmployeeListFilterState(
      {final int page,
      final int size,
      final String? search,
      final String? role,
      final int? branchId}) = _$EmployeeListFilterStateImpl;

  @override
  int get page;
  @override
  int get size;
  @override
  String? get search;
  @override
  String? get role;
  @override
  int? get branchId;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeListFilterStateImplCopyWith<_$EmployeeListFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
