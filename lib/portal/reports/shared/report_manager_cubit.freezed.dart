// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_manager_cubit/report_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportManagerState {
  List<ReportTask> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportManagerStateCopyWith<ReportManagerState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportManagerStateCopyWith<$Res> {
  factory $ReportManagerStateCopyWith(ReportManagerState value, $Res Function(ReportManagerState) then) =
      _$ReportManagerStateCopyWithImpl<$Res, ReportManagerState>;
  @useResult
  $Res call({List<ReportTask> tasks});
}

/// @nodoc
class _$ReportManagerStateCopyWithImpl<$Res, $Val extends ReportManagerState>
    implements $ReportManagerStateCopyWith<$Res> {
  _$ReportManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<ReportTask>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportManagerStateImplCopyWith<$Res> implements $ReportManagerStateCopyWith<$Res> {
  factory _$$ReportManagerStateImplCopyWith(
          _$ReportManagerStateImpl value, $Res Function(_$ReportManagerStateImpl) then) =
      __$$ReportManagerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReportTask> tasks});
}

/// @nodoc
class __$$ReportManagerStateImplCopyWithImpl<$Res>
    extends _$ReportManagerStateCopyWithImpl<$Res, _$ReportManagerStateImpl>
    implements _$$ReportManagerStateImplCopyWith<$Res> {
  __$$ReportManagerStateImplCopyWithImpl(_$ReportManagerStateImpl _value, $Res Function(_$ReportManagerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$ReportManagerStateImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<ReportTask>,
    ));
  }
}

/// @nodoc

class _$ReportManagerStateImpl implements _ReportManagerState {
  const _$ReportManagerStateImpl({final List<ReportTask> tasks = const <ReportTask>[]}) : _tasks = tasks;

  final List<ReportTask> _tasks;
  @override
  @JsonKey()
  List<ReportTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'ReportManagerState(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportManagerStateImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportManagerStateImplCopyWith<_$ReportManagerStateImpl> get copyWith =>
      __$$ReportManagerStateImplCopyWithImpl<_$ReportManagerStateImpl>(this, _$identity);
}

abstract class _ReportManagerState implements ReportManagerState {
  const factory _ReportManagerState({final List<ReportTask> tasks}) = _$ReportManagerStateImpl;

  @override
  List<ReportTask> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$ReportManagerStateImplCopyWith<_$ReportManagerStateImpl> get copyWith => throw _privateConstructorUsedError;
}
