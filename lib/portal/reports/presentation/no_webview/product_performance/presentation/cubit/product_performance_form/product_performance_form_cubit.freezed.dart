// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_performance_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPerformanceFormState {
  ProductPerformanceType? get type => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;
  List<Category>? get categories => throw _privateConstructorUsedError;
  int? get topN => throw _privateConstructorUsedError; // For PNL
  RankingCriteria? get rankingCriteria => throw _privateConstructorUsedError;
  Period? get period => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get month => throw _privateConstructorUsedError;
  Quarter? get quarter => throw _privateConstructorUsedError;
  HalfYear? get halfYear => throw _privateConstructorUsedError;
  DateTime? get customStartDate => throw _privateConstructorUsedError;
  DateTime? get customEndDate => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;
  bool get isTypeSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductPerformanceFormStateCopyWith<ProductPerformanceFormState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPerformanceFormStateCopyWith<$Res> {
  factory $ProductPerformanceFormStateCopyWith(
          ProductPerformanceFormState value,
          $Res Function(ProductPerformanceFormState) then) =
      _$ProductPerformanceFormStateCopyWithImpl<$Res,
          ProductPerformanceFormState>;
  @useResult
  $Res call(
      {ProductPerformanceType? type,
      Branch? branch,
      List<Category>? categories,
      int? topN,
      RankingCriteria? rankingCriteria,
      Period? period,
      int? year,
      String? month,
      Quarter? quarter,
      HalfYear? halfYear,
      DateTime? customStartDate,
      DateTime? customEndDate,
      bool isFormValid,
      bool isTypeSelected});

  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$ProductPerformanceFormStateCopyWithImpl<$Res,
        $Val extends ProductPerformanceFormState>
    implements $ProductPerformanceFormStateCopyWith<$Res> {
  _$ProductPerformanceFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? branch = freezed,
    Object? categories = freezed,
    Object? topN = freezed,
    Object? rankingCriteria = freezed,
    Object? period = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? quarter = freezed,
    Object? halfYear = freezed,
    Object? customStartDate = freezed,
    Object? customEndDate = freezed,
    Object? isFormValid = null,
    Object? isTypeSelected = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductPerformanceType?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      topN: freezed == topN
          ? _value.topN
          : topN // ignore: cast_nullable_to_non_nullable
              as int?,
      rankingCriteria: freezed == rankingCriteria
          ? _value.rankingCriteria
          : rankingCriteria // ignore: cast_nullable_to_non_nullable
              as RankingCriteria?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      quarter: freezed == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      halfYear: freezed == halfYear
          ? _value.halfYear
          : halfYear // ignore: cast_nullable_to_non_nullable
              as HalfYear?,
      customStartDate: freezed == customStartDate
          ? _value.customStartDate
          : customStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customEndDate: freezed == customEndDate
          ? _value.customEndDate
          : customEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isTypeSelected: null == isTypeSelected
          ? _value.isTypeSelected
          : isTypeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$BranchFormStateImplCopyWith<$Res>
    implements $ProductPerformanceFormStateCopyWith<$Res> {
  factory _$$BranchFormStateImplCopyWith(_$BranchFormStateImpl value,
          $Res Function(_$BranchFormStateImpl) then) =
      __$$BranchFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductPerformanceType? type,
      Branch? branch,
      List<Category>? categories,
      int? topN,
      RankingCriteria? rankingCriteria,
      Period? period,
      int? year,
      String? month,
      Quarter? quarter,
      HalfYear? halfYear,
      DateTime? customStartDate,
      DateTime? customEndDate,
      bool isFormValid,
      bool isTypeSelected});

  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$BranchFormStateImplCopyWithImpl<$Res>
    extends _$ProductPerformanceFormStateCopyWithImpl<$Res,
        _$BranchFormStateImpl> implements _$$BranchFormStateImplCopyWith<$Res> {
  __$$BranchFormStateImplCopyWithImpl(
      _$BranchFormStateImpl _value, $Res Function(_$BranchFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? branch = freezed,
    Object? categories = freezed,
    Object? topN = freezed,
    Object? rankingCriteria = freezed,
    Object? period = freezed,
    Object? year = freezed,
    Object? month = freezed,
    Object? quarter = freezed,
    Object? halfYear = freezed,
    Object? customStartDate = freezed,
    Object? customEndDate = freezed,
    Object? isFormValid = null,
    Object? isTypeSelected = null,
  }) {
    return _then(_$BranchFormStateImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductPerformanceType?,
      branch: freezed == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      topN: freezed == topN
          ? _value.topN
          : topN // ignore: cast_nullable_to_non_nullable
              as int?,
      rankingCriteria: freezed == rankingCriteria
          ? _value.rankingCriteria
          : rankingCriteria // ignore: cast_nullable_to_non_nullable
              as RankingCriteria?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String?,
      quarter: freezed == quarter
          ? _value.quarter
          : quarter // ignore: cast_nullable_to_non_nullable
              as Quarter?,
      halfYear: freezed == halfYear
          ? _value.halfYear
          : halfYear // ignore: cast_nullable_to_non_nullable
              as HalfYear?,
      customStartDate: freezed == customStartDate
          ? _value.customStartDate
          : customStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customEndDate: freezed == customEndDate
          ? _value.customEndDate
          : customEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isTypeSelected: null == isTypeSelected
          ? _value.isTypeSelected
          : isTypeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BranchFormStateImpl extends _BranchFormState {
  const _$BranchFormStateImpl(
      {this.type,
      this.branch,
      final List<Category>? categories,
      this.topN,
      this.rankingCriteria,
      this.period,
      this.year,
      this.month,
      this.quarter,
      this.halfYear,
      this.customStartDate,
      this.customEndDate,
      this.isFormValid = true,
      this.isTypeSelected = true})
      : _categories = categories,
        super._();

  @override
  final ProductPerformanceType? type;
  @override
  final Branch? branch;
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
// For PNL
  @override
  final RankingCriteria? rankingCriteria;
  @override
  final Period? period;
  @override
  final int? year;
  @override
  final String? month;
  @override
  final Quarter? quarter;
  @override
  final HalfYear? halfYear;
  @override
  final DateTime? customStartDate;
  @override
  final DateTime? customEndDate;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  @JsonKey()
  final bool isTypeSelected;

  @override
  String toString() {
    return 'ProductPerformanceFormState(type: $type, branch: $branch, categories: $categories, topN: $topN, rankingCriteria: $rankingCriteria, period: $period, year: $year, month: $month, quarter: $quarter, halfYear: $halfYear, customStartDate: $customStartDate, customEndDate: $customEndDate, isFormValid: $isFormValid, isTypeSelected: $isTypeSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchFormStateImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.topN, topN) || other.topN == topN) &&
            (identical(other.rankingCriteria, rankingCriteria) ||
                other.rankingCriteria == rankingCriteria) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.quarter, quarter) || other.quarter == quarter) &&
            (identical(other.halfYear, halfYear) ||
                other.halfYear == halfYear) &&
            (identical(other.customStartDate, customStartDate) ||
                other.customStartDate == customStartDate) &&
            (identical(other.customEndDate, customEndDate) ||
                other.customEndDate == customEndDate) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.isTypeSelected, isTypeSelected) ||
                other.isTypeSelected == isTypeSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      branch,
      const DeepCollectionEquality().hash(_categories),
      topN,
      rankingCriteria,
      period,
      year,
      month,
      quarter,
      halfYear,
      customStartDate,
      customEndDate,
      isFormValid,
      isTypeSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchFormStateImplCopyWith<_$BranchFormStateImpl> get copyWith =>
      __$$BranchFormStateImplCopyWithImpl<_$BranchFormStateImpl>(
          this, _$identity);
}

abstract class _BranchFormState extends ProductPerformanceFormState {
  const factory _BranchFormState(
      {final ProductPerformanceType? type,
      final Branch? branch,
      final List<Category>? categories,
      final int? topN,
      final RankingCriteria? rankingCriteria,
      final Period? period,
      final int? year,
      final String? month,
      final Quarter? quarter,
      final HalfYear? halfYear,
      final DateTime? customStartDate,
      final DateTime? customEndDate,
      final bool isFormValid,
      final bool isTypeSelected}) = _$BranchFormStateImpl;
  const _BranchFormState._() : super._();

  @override
  ProductPerformanceType? get type;
  @override
  Branch? get branch;
  @override
  List<Category>? get categories;
  @override
  int? get topN;
  @override // For PNL
  RankingCriteria? get rankingCriteria;
  @override
  Period? get period;
  @override
  int? get year;
  @override
  String? get month;
  @override
  Quarter? get quarter;
  @override
  HalfYear? get halfYear;
  @override
  DateTime? get customStartDate;
  @override
  DateTime? get customEndDate;
  @override
  bool get isFormValid;
  @override
  bool get isTypeSelected;
  @override
  @JsonKey(ignore: true)
  _$$BranchFormStateImplCopyWith<_$BranchFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
