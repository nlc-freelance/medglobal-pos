// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_performance_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPerformanceListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageQuery filters) getReports,
    required TResult Function(Report report) addReport,
    required TResult Function(int id, Report Function(Report) update)
        updateReport,
    required TResult Function(int id) removeReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageQuery filters)? getReports,
    TResult? Function(Report report)? addReport,
    TResult? Function(int id, Report Function(Report) update)? updateReport,
    TResult? Function(int id)? removeReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageQuery filters)? getReports,
    TResult Function(Report report)? addReport,
    TResult Function(int id, Report Function(Report) update)? updateReport,
    TResult Function(int id)? removeReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProductPerformanceReports value) getReports,
    required TResult Function(_AddReport value) addReport,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_RemoveReport value) removeReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProductPerformanceReports value)? getReports,
    TResult? Function(_AddReport value)? addReport,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_RemoveReport value)? removeReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProductPerformanceReports value)? getReports,
    TResult Function(_AddReport value)? addReport,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_RemoveReport value)? removeReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPerformanceListEventCopyWith<$Res> {
  factory $ProductPerformanceListEventCopyWith(
          ProductPerformanceListEvent value,
          $Res Function(ProductPerformanceListEvent) then) =
      _$ProductPerformanceListEventCopyWithImpl<$Res,
          ProductPerformanceListEvent>;
}

/// @nodoc
class _$ProductPerformanceListEventCopyWithImpl<$Res,
        $Val extends ProductPerformanceListEvent>
    implements $ProductPerformanceListEventCopyWith<$Res> {
  _$ProductPerformanceListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetProductPerformanceReportsImplCopyWith<$Res> {
  factory _$$GetProductPerformanceReportsImplCopyWith(
          _$GetProductPerformanceReportsImpl value,
          $Res Function(_$GetProductPerformanceReportsImpl) then) =
      __$$GetProductPerformanceReportsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageQuery filters});

  $PageQueryCopyWith<$Res> get filters;
}

/// @nodoc
class __$$GetProductPerformanceReportsImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListEventCopyWithImpl<$Res,
        _$GetProductPerformanceReportsImpl>
    implements _$$GetProductPerformanceReportsImplCopyWith<$Res> {
  __$$GetProductPerformanceReportsImplCopyWithImpl(
      _$GetProductPerformanceReportsImpl _value,
      $Res Function(_$GetProductPerformanceReportsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
  }) {
    return _then(_$GetProductPerformanceReportsImpl(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as PageQuery,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PageQueryCopyWith<$Res> get filters {
    return $PageQueryCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc

class _$GetProductPerformanceReportsImpl
    implements _GetProductPerformanceReports {
  const _$GetProductPerformanceReportsImpl({required this.filters});

  @override
  final PageQuery filters;

  @override
  String toString() {
    return 'ProductPerformanceListEvent.getReports(filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductPerformanceReportsImpl &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductPerformanceReportsImplCopyWith<
          _$GetProductPerformanceReportsImpl>
      get copyWith => __$$GetProductPerformanceReportsImplCopyWithImpl<
          _$GetProductPerformanceReportsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageQuery filters) getReports,
    required TResult Function(Report report) addReport,
    required TResult Function(int id, Report Function(Report) update)
        updateReport,
    required TResult Function(int id) removeReport,
  }) {
    return getReports(filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageQuery filters)? getReports,
    TResult? Function(Report report)? addReport,
    TResult? Function(int id, Report Function(Report) update)? updateReport,
    TResult? Function(int id)? removeReport,
  }) {
    return getReports?.call(filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageQuery filters)? getReports,
    TResult Function(Report report)? addReport,
    TResult Function(int id, Report Function(Report) update)? updateReport,
    TResult Function(int id)? removeReport,
    required TResult orElse(),
  }) {
    if (getReports != null) {
      return getReports(filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProductPerformanceReports value) getReports,
    required TResult Function(_AddReport value) addReport,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_RemoveReport value) removeReport,
  }) {
    return getReports(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProductPerformanceReports value)? getReports,
    TResult? Function(_AddReport value)? addReport,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_RemoveReport value)? removeReport,
  }) {
    return getReports?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProductPerformanceReports value)? getReports,
    TResult Function(_AddReport value)? addReport,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_RemoveReport value)? removeReport,
    required TResult orElse(),
  }) {
    if (getReports != null) {
      return getReports(this);
    }
    return orElse();
  }
}

abstract class _GetProductPerformanceReports
    implements ProductPerformanceListEvent {
  const factory _GetProductPerformanceReports(
      {required final PageQuery filters}) = _$GetProductPerformanceReportsImpl;

  PageQuery get filters;
  @JsonKey(ignore: true)
  _$$GetProductPerformanceReportsImplCopyWith<
          _$GetProductPerformanceReportsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddReportImplCopyWith<$Res> {
  factory _$$AddReportImplCopyWith(
          _$AddReportImpl value, $Res Function(_$AddReportImpl) then) =
      __$$AddReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Report report});

  $ReportCopyWith<$Res> get report;
}

/// @nodoc
class __$$AddReportImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListEventCopyWithImpl<$Res, _$AddReportImpl>
    implements _$$AddReportImplCopyWith<$Res> {
  __$$AddReportImplCopyWithImpl(
      _$AddReportImpl _value, $Res Function(_$AddReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_$AddReportImpl(
      null == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportCopyWith<$Res> get report {
    return $ReportCopyWith<$Res>(_value.report, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc

class _$AddReportImpl implements _AddReport {
  const _$AddReportImpl(this.report);

  @override
  final Report report;

  @override
  String toString() {
    return 'ProductPerformanceListEvent.addReport(report: $report)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddReportImpl &&
            (identical(other.report, report) || other.report == report));
  }

  @override
  int get hashCode => Object.hash(runtimeType, report);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddReportImplCopyWith<_$AddReportImpl> get copyWith =>
      __$$AddReportImplCopyWithImpl<_$AddReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageQuery filters) getReports,
    required TResult Function(Report report) addReport,
    required TResult Function(int id, Report Function(Report) update)
        updateReport,
    required TResult Function(int id) removeReport,
  }) {
    return addReport(report);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageQuery filters)? getReports,
    TResult? Function(Report report)? addReport,
    TResult? Function(int id, Report Function(Report) update)? updateReport,
    TResult? Function(int id)? removeReport,
  }) {
    return addReport?.call(report);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageQuery filters)? getReports,
    TResult Function(Report report)? addReport,
    TResult Function(int id, Report Function(Report) update)? updateReport,
    TResult Function(int id)? removeReport,
    required TResult orElse(),
  }) {
    if (addReport != null) {
      return addReport(report);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProductPerformanceReports value) getReports,
    required TResult Function(_AddReport value) addReport,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_RemoveReport value) removeReport,
  }) {
    return addReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProductPerformanceReports value)? getReports,
    TResult? Function(_AddReport value)? addReport,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_RemoveReport value)? removeReport,
  }) {
    return addReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProductPerformanceReports value)? getReports,
    TResult Function(_AddReport value)? addReport,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_RemoveReport value)? removeReport,
    required TResult orElse(),
  }) {
    if (addReport != null) {
      return addReport(this);
    }
    return orElse();
  }
}

abstract class _AddReport implements ProductPerformanceListEvent {
  const factory _AddReport(final Report report) = _$AddReportImpl;

  Report get report;
  @JsonKey(ignore: true)
  _$$AddReportImplCopyWith<_$AddReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateReportImplCopyWith<$Res> {
  factory _$$UpdateReportImplCopyWith(
          _$UpdateReportImpl value, $Res Function(_$UpdateReportImpl) then) =
      __$$UpdateReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, Report Function(Report) update});
}

/// @nodoc
class __$$UpdateReportImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListEventCopyWithImpl<$Res, _$UpdateReportImpl>
    implements _$$UpdateReportImplCopyWith<$Res> {
  __$$UpdateReportImplCopyWithImpl(
      _$UpdateReportImpl _value, $Res Function(_$UpdateReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? update = null,
  }) {
    return _then(_$UpdateReportImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as Report Function(Report),
    ));
  }
}

/// @nodoc

class _$UpdateReportImpl implements _UpdateReport {
  const _$UpdateReportImpl(this.id, this.update);

  @override
  final int id;
  @override
  final Report Function(Report) update;

  @override
  String toString() {
    return 'ProductPerformanceListEvent.updateReport(id: $id, update: $update)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.update, update) || other.update == update));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReportImplCopyWith<_$UpdateReportImpl> get copyWith =>
      __$$UpdateReportImplCopyWithImpl<_$UpdateReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageQuery filters) getReports,
    required TResult Function(Report report) addReport,
    required TResult Function(int id, Report Function(Report) update)
        updateReport,
    required TResult Function(int id) removeReport,
  }) {
    return updateReport(id, update);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageQuery filters)? getReports,
    TResult? Function(Report report)? addReport,
    TResult? Function(int id, Report Function(Report) update)? updateReport,
    TResult? Function(int id)? removeReport,
  }) {
    return updateReport?.call(id, update);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageQuery filters)? getReports,
    TResult Function(Report report)? addReport,
    TResult Function(int id, Report Function(Report) update)? updateReport,
    TResult Function(int id)? removeReport,
    required TResult orElse(),
  }) {
    if (updateReport != null) {
      return updateReport(id, update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProductPerformanceReports value) getReports,
    required TResult Function(_AddReport value) addReport,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_RemoveReport value) removeReport,
  }) {
    return updateReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProductPerformanceReports value)? getReports,
    TResult? Function(_AddReport value)? addReport,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_RemoveReport value)? removeReport,
  }) {
    return updateReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProductPerformanceReports value)? getReports,
    TResult Function(_AddReport value)? addReport,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_RemoveReport value)? removeReport,
    required TResult orElse(),
  }) {
    if (updateReport != null) {
      return updateReport(this);
    }
    return orElse();
  }
}

abstract class _UpdateReport implements ProductPerformanceListEvent {
  const factory _UpdateReport(
      final int id, final Report Function(Report) update) = _$UpdateReportImpl;

  int get id;
  Report Function(Report) get update;
  @JsonKey(ignore: true)
  _$$UpdateReportImplCopyWith<_$UpdateReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveReportImplCopyWith<$Res> {
  factory _$$RemoveReportImplCopyWith(
          _$RemoveReportImpl value, $Res Function(_$RemoveReportImpl) then) =
      __$$RemoveReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveReportImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListEventCopyWithImpl<$Res, _$RemoveReportImpl>
    implements _$$RemoveReportImplCopyWith<$Res> {
  __$$RemoveReportImplCopyWithImpl(
      _$RemoveReportImpl _value, $Res Function(_$RemoveReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveReportImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveReportImpl implements _RemoveReport {
  const _$RemoveReportImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductPerformanceListEvent.removeReport(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveReportImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveReportImplCopyWith<_$RemoveReportImpl> get copyWith =>
      __$$RemoveReportImplCopyWithImpl<_$RemoveReportImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PageQuery filters) getReports,
    required TResult Function(Report report) addReport,
    required TResult Function(int id, Report Function(Report) update)
        updateReport,
    required TResult Function(int id) removeReport,
  }) {
    return removeReport(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageQuery filters)? getReports,
    TResult? Function(Report report)? addReport,
    TResult? Function(int id, Report Function(Report) update)? updateReport,
    TResult? Function(int id)? removeReport,
  }) {
    return removeReport?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageQuery filters)? getReports,
    TResult Function(Report report)? addReport,
    TResult Function(int id, Report Function(Report) update)? updateReport,
    TResult Function(int id)? removeReport,
    required TResult orElse(),
  }) {
    if (removeReport != null) {
      return removeReport(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProductPerformanceReports value) getReports,
    required TResult Function(_AddReport value) addReport,
    required TResult Function(_UpdateReport value) updateReport,
    required TResult Function(_RemoveReport value) removeReport,
  }) {
    return removeReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProductPerformanceReports value)? getReports,
    TResult? Function(_AddReport value)? addReport,
    TResult? Function(_UpdateReport value)? updateReport,
    TResult? Function(_RemoveReport value)? removeReport,
  }) {
    return removeReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProductPerformanceReports value)? getReports,
    TResult Function(_AddReport value)? addReport,
    TResult Function(_UpdateReport value)? updateReport,
    TResult Function(_RemoveReport value)? removeReport,
    required TResult orElse(),
  }) {
    if (removeReport != null) {
      return removeReport(this);
    }
    return orElse();
  }
}

abstract class _RemoveReport implements ProductPerformanceListEvent {
  const factory _RemoveReport(final int id) = _$RemoveReportImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$RemoveReportImplCopyWith<_$RemoveReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductPerformanceListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaginatedList<Report> data, dynamic addedNew)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPerformanceListStateCopyWith<$Res> {
  factory $ProductPerformanceListStateCopyWith(
          ProductPerformanceListState value,
          $Res Function(ProductPerformanceListState) then) =
      _$ProductPerformanceListStateCopyWithImpl<$Res,
          ProductPerformanceListState>;
}

/// @nodoc
class _$ProductPerformanceListStateCopyWithImpl<$Res,
        $Val extends ProductPerformanceListState>
    implements $ProductPerformanceListStateCopyWith<$Res> {
  _$ProductPerformanceListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductPerformanceListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaginatedList<Report> data, dynamic addedNew)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductPerformanceListState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductPerformanceListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaginatedList<Report> data, dynamic addedNew)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductPerformanceListState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaginatedList<Report> data, dynamic addedNew});

  $PaginatedListCopyWith<Report, $Res> get data;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? addedNew = freezed,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaginatedList<Report>,
      addedNew: freezed == addedNew ? _value.addedNew! : addedNew,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginatedListCopyWith<Report, $Res> get data {
    return $PaginatedListCopyWith<Report, $Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data, {this.addedNew = false});

  @override
  final PaginatedList<Report> data;
  @override
  @JsonKey()
  final dynamic addedNew;

  @override
  String toString() {
    return 'ProductPerformanceListState.loaded(data: $data, addedNew: $addedNew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other.addedNew, addedNew));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, data, const DeepCollectionEquality().hash(addedNew));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaginatedList<Report> data, dynamic addedNew)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return loaded(data, addedNew);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(data, addedNew);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data, addedNew);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ProductPerformanceListState {
  const factory _Loaded(final PaginatedList<Report> data,
      {final dynamic addedNew}) = _$LoadedImpl;

  PaginatedList<Report> get data;
  dynamic get addedNew;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'ProductPerformanceListState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaginatedList<Report> data, dynamic addedNew)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements ProductPerformanceListState {
  const factory _Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$ProductPerformanceListStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductPerformanceListState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PaginatedList<Report> data, dynamic addedNew)
        loaded,
    required TResult Function() empty,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult? Function()? empty,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PaginatedList<Report> data, dynamic addedNew)? loaded,
    TResult Function()? empty,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ProductPerformanceListState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
