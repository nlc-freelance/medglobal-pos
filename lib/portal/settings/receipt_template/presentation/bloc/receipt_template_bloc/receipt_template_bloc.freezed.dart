// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_template_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReceiptTemplateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getReceiptTemplateById,
    required TResult Function(ReceiptTemplate template) createReceiptTemplate,
    required TResult Function(ReceiptTemplate template) updateReceiptTemplate,
    required TResult Function(ReceiptTemplate template) deleteReceiptTemplate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getReceiptTemplateById,
    TResult? Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? deleteReceiptTemplate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getReceiptTemplateById,
    TResult Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult Function(ReceiptTemplate template)? deleteReceiptTemplate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReceiptTemplateById value)
        getReceiptTemplateById,
    required TResult Function(_CreateReceiptTemplate value)
        createReceiptTemplate,
    required TResult Function(_UpdateReceiptTemplate value)
        updateReceiptTemplate,
    required TResult Function(_DeleteReceiptTemplate value)
        deleteReceiptTemplate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult? Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult? Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult? Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptTemplateEventCopyWith<$Res> {
  factory $ReceiptTemplateEventCopyWith(ReceiptTemplateEvent value,
          $Res Function(ReceiptTemplateEvent) then) =
      _$ReceiptTemplateEventCopyWithImpl<$Res, ReceiptTemplateEvent>;
}

/// @nodoc
class _$ReceiptTemplateEventCopyWithImpl<$Res,
        $Val extends ReceiptTemplateEvent>
    implements $ReceiptTemplateEventCopyWith<$Res> {
  _$ReceiptTemplateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetReceiptTemplateByIdImplCopyWith<$Res> {
  factory _$$GetReceiptTemplateByIdImplCopyWith(
          _$GetReceiptTemplateByIdImpl value,
          $Res Function(_$GetReceiptTemplateByIdImpl) then) =
      __$$GetReceiptTemplateByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetReceiptTemplateByIdImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateEventCopyWithImpl<$Res,
        _$GetReceiptTemplateByIdImpl>
    implements _$$GetReceiptTemplateByIdImplCopyWith<$Res> {
  __$$GetReceiptTemplateByIdImplCopyWithImpl(
      _$GetReceiptTemplateByIdImpl _value,
      $Res Function(_$GetReceiptTemplateByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetReceiptTemplateByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetReceiptTemplateByIdImpl implements _GetReceiptTemplateById {
  const _$GetReceiptTemplateByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ReceiptTemplateEvent.getReceiptTemplateById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReceiptTemplateByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReceiptTemplateByIdImplCopyWith<_$GetReceiptTemplateByIdImpl>
      get copyWith => __$$GetReceiptTemplateByIdImplCopyWithImpl<
          _$GetReceiptTemplateByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getReceiptTemplateById,
    required TResult Function(ReceiptTemplate template) createReceiptTemplate,
    required TResult Function(ReceiptTemplate template) updateReceiptTemplate,
    required TResult Function(ReceiptTemplate template) deleteReceiptTemplate,
  }) {
    return getReceiptTemplateById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getReceiptTemplateById,
    TResult? Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? deleteReceiptTemplate,
  }) {
    return getReceiptTemplateById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getReceiptTemplateById,
    TResult Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult Function(ReceiptTemplate template)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (getReceiptTemplateById != null) {
      return getReceiptTemplateById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReceiptTemplateById value)
        getReceiptTemplateById,
    required TResult Function(_CreateReceiptTemplate value)
        createReceiptTemplate,
    required TResult Function(_UpdateReceiptTemplate value)
        updateReceiptTemplate,
    required TResult Function(_DeleteReceiptTemplate value)
        deleteReceiptTemplate,
  }) {
    return getReceiptTemplateById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult? Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult? Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult? Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
  }) {
    return getReceiptTemplateById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (getReceiptTemplateById != null) {
      return getReceiptTemplateById(this);
    }
    return orElse();
  }
}

abstract class _GetReceiptTemplateById implements ReceiptTemplateEvent {
  const factory _GetReceiptTemplateById(final int id) =
      _$GetReceiptTemplateByIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetReceiptTemplateByIdImplCopyWith<_$GetReceiptTemplateByIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateReceiptTemplateImplCopyWith<$Res> {
  factory _$$CreateReceiptTemplateImplCopyWith(
          _$CreateReceiptTemplateImpl value,
          $Res Function(_$CreateReceiptTemplateImpl) then) =
      __$$CreateReceiptTemplateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReceiptTemplate template});

  $ReceiptTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$CreateReceiptTemplateImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateEventCopyWithImpl<$Res,
        _$CreateReceiptTemplateImpl>
    implements _$$CreateReceiptTemplateImplCopyWith<$Res> {
  __$$CreateReceiptTemplateImplCopyWithImpl(_$CreateReceiptTemplateImpl _value,
      $Res Function(_$CreateReceiptTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
  }) {
    return _then(_$CreateReceiptTemplateImpl(
      null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateCopyWith<$Res> get template {
    return $ReceiptTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value));
    });
  }
}

/// @nodoc

class _$CreateReceiptTemplateImpl implements _CreateReceiptTemplate {
  const _$CreateReceiptTemplateImpl(this.template);

  @override
  final ReceiptTemplate template;

  @override
  String toString() {
    return 'ReceiptTemplateEvent.createReceiptTemplate(template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReceiptTemplateImpl &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReceiptTemplateImplCopyWith<_$CreateReceiptTemplateImpl>
      get copyWith => __$$CreateReceiptTemplateImplCopyWithImpl<
          _$CreateReceiptTemplateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getReceiptTemplateById,
    required TResult Function(ReceiptTemplate template) createReceiptTemplate,
    required TResult Function(ReceiptTemplate template) updateReceiptTemplate,
    required TResult Function(ReceiptTemplate template) deleteReceiptTemplate,
  }) {
    return createReceiptTemplate(template);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getReceiptTemplateById,
    TResult? Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? deleteReceiptTemplate,
  }) {
    return createReceiptTemplate?.call(template);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getReceiptTemplateById,
    TResult Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult Function(ReceiptTemplate template)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (createReceiptTemplate != null) {
      return createReceiptTemplate(template);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReceiptTemplateById value)
        getReceiptTemplateById,
    required TResult Function(_CreateReceiptTemplate value)
        createReceiptTemplate,
    required TResult Function(_UpdateReceiptTemplate value)
        updateReceiptTemplate,
    required TResult Function(_DeleteReceiptTemplate value)
        deleteReceiptTemplate,
  }) {
    return createReceiptTemplate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult? Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult? Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult? Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
  }) {
    return createReceiptTemplate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (createReceiptTemplate != null) {
      return createReceiptTemplate(this);
    }
    return orElse();
  }
}

abstract class _CreateReceiptTemplate implements ReceiptTemplateEvent {
  const factory _CreateReceiptTemplate(final ReceiptTemplate template) =
      _$CreateReceiptTemplateImpl;

  ReceiptTemplate get template;
  @JsonKey(ignore: true)
  _$$CreateReceiptTemplateImplCopyWith<_$CreateReceiptTemplateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateReceiptTemplateImplCopyWith<$Res> {
  factory _$$UpdateReceiptTemplateImplCopyWith(
          _$UpdateReceiptTemplateImpl value,
          $Res Function(_$UpdateReceiptTemplateImpl) then) =
      __$$UpdateReceiptTemplateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReceiptTemplate template});

  $ReceiptTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$UpdateReceiptTemplateImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateEventCopyWithImpl<$Res,
        _$UpdateReceiptTemplateImpl>
    implements _$$UpdateReceiptTemplateImplCopyWith<$Res> {
  __$$UpdateReceiptTemplateImplCopyWithImpl(_$UpdateReceiptTemplateImpl _value,
      $Res Function(_$UpdateReceiptTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
  }) {
    return _then(_$UpdateReceiptTemplateImpl(
      null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateCopyWith<$Res> get template {
    return $ReceiptTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value));
    });
  }
}

/// @nodoc

class _$UpdateReceiptTemplateImpl implements _UpdateReceiptTemplate {
  const _$UpdateReceiptTemplateImpl(this.template);

  @override
  final ReceiptTemplate template;

  @override
  String toString() {
    return 'ReceiptTemplateEvent.updateReceiptTemplate(template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReceiptTemplateImpl &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReceiptTemplateImplCopyWith<_$UpdateReceiptTemplateImpl>
      get copyWith => __$$UpdateReceiptTemplateImplCopyWithImpl<
          _$UpdateReceiptTemplateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getReceiptTemplateById,
    required TResult Function(ReceiptTemplate template) createReceiptTemplate,
    required TResult Function(ReceiptTemplate template) updateReceiptTemplate,
    required TResult Function(ReceiptTemplate template) deleteReceiptTemplate,
  }) {
    return updateReceiptTemplate(template);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getReceiptTemplateById,
    TResult? Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? deleteReceiptTemplate,
  }) {
    return updateReceiptTemplate?.call(template);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getReceiptTemplateById,
    TResult Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult Function(ReceiptTemplate template)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (updateReceiptTemplate != null) {
      return updateReceiptTemplate(template);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReceiptTemplateById value)
        getReceiptTemplateById,
    required TResult Function(_CreateReceiptTemplate value)
        createReceiptTemplate,
    required TResult Function(_UpdateReceiptTemplate value)
        updateReceiptTemplate,
    required TResult Function(_DeleteReceiptTemplate value)
        deleteReceiptTemplate,
  }) {
    return updateReceiptTemplate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult? Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult? Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult? Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
  }) {
    return updateReceiptTemplate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (updateReceiptTemplate != null) {
      return updateReceiptTemplate(this);
    }
    return orElse();
  }
}

abstract class _UpdateReceiptTemplate implements ReceiptTemplateEvent {
  const factory _UpdateReceiptTemplate(final ReceiptTemplate template) =
      _$UpdateReceiptTemplateImpl;

  ReceiptTemplate get template;
  @JsonKey(ignore: true)
  _$$UpdateReceiptTemplateImplCopyWith<_$UpdateReceiptTemplateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteReceiptTemplateImplCopyWith<$Res> {
  factory _$$DeleteReceiptTemplateImplCopyWith(
          _$DeleteReceiptTemplateImpl value,
          $Res Function(_$DeleteReceiptTemplateImpl) then) =
      __$$DeleteReceiptTemplateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReceiptTemplate template});

  $ReceiptTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$DeleteReceiptTemplateImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateEventCopyWithImpl<$Res,
        _$DeleteReceiptTemplateImpl>
    implements _$$DeleteReceiptTemplateImplCopyWith<$Res> {
  __$$DeleteReceiptTemplateImplCopyWithImpl(_$DeleteReceiptTemplateImpl _value,
      $Res Function(_$DeleteReceiptTemplateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
  }) {
    return _then(_$DeleteReceiptTemplateImpl(
      null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateCopyWith<$Res> get template {
    return $ReceiptTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value));
    });
  }
}

/// @nodoc

class _$DeleteReceiptTemplateImpl implements _DeleteReceiptTemplate {
  const _$DeleteReceiptTemplateImpl(this.template);

  @override
  final ReceiptTemplate template;

  @override
  String toString() {
    return 'ReceiptTemplateEvent.deleteReceiptTemplate(template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteReceiptTemplateImpl &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteReceiptTemplateImplCopyWith<_$DeleteReceiptTemplateImpl>
      get copyWith => __$$DeleteReceiptTemplateImplCopyWithImpl<
          _$DeleteReceiptTemplateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getReceiptTemplateById,
    required TResult Function(ReceiptTemplate template) createReceiptTemplate,
    required TResult Function(ReceiptTemplate template) updateReceiptTemplate,
    required TResult Function(ReceiptTemplate template) deleteReceiptTemplate,
  }) {
    return deleteReceiptTemplate(template);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getReceiptTemplateById,
    TResult? Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult? Function(ReceiptTemplate template)? deleteReceiptTemplate,
  }) {
    return deleteReceiptTemplate?.call(template);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getReceiptTemplateById,
    TResult Function(ReceiptTemplate template)? createReceiptTemplate,
    TResult Function(ReceiptTemplate template)? updateReceiptTemplate,
    TResult Function(ReceiptTemplate template)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (deleteReceiptTemplate != null) {
      return deleteReceiptTemplate(template);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReceiptTemplateById value)
        getReceiptTemplateById,
    required TResult Function(_CreateReceiptTemplate value)
        createReceiptTemplate,
    required TResult Function(_UpdateReceiptTemplate value)
        updateReceiptTemplate,
    required TResult Function(_DeleteReceiptTemplate value)
        deleteReceiptTemplate,
  }) {
    return deleteReceiptTemplate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult? Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult? Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult? Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
  }) {
    return deleteReceiptTemplate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReceiptTemplateById value)? getReceiptTemplateById,
    TResult Function(_CreateReceiptTemplate value)? createReceiptTemplate,
    TResult Function(_UpdateReceiptTemplate value)? updateReceiptTemplate,
    TResult Function(_DeleteReceiptTemplate value)? deleteReceiptTemplate,
    required TResult orElse(),
  }) {
    if (deleteReceiptTemplate != null) {
      return deleteReceiptTemplate(this);
    }
    return orElse();
  }
}

abstract class _DeleteReceiptTemplate implements ReceiptTemplateEvent {
  const factory _DeleteReceiptTemplate(final ReceiptTemplate template) =
      _$DeleteReceiptTemplateImpl;

  ReceiptTemplate get template;
  @JsonKey(ignore: true)
  _$$DeleteReceiptTemplateImplCopyWith<_$DeleteReceiptTemplateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReceiptTemplateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptTemplateStateCopyWith<$Res> {
  factory $ReceiptTemplateStateCopyWith(ReceiptTemplateState value,
          $Res Function(ReceiptTemplateState) then) =
      _$ReceiptTemplateStateCopyWithImpl<$Res, ReceiptTemplateState>;
}

/// @nodoc
class _$ReceiptTemplateStateCopyWithImpl<$Res,
        $Val extends ReceiptTemplateState>
    implements $ReceiptTemplateStateCopyWith<$Res> {
  _$ReceiptTemplateStateCopyWithImpl(this._value, this._then);

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
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ReceiptTemplateState.initial()';
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
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
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
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
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
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
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
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReceiptTemplateState {
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
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ReceiptTemplateState.loading()';
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
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
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
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
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
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
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
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReceiptTemplateState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReceiptTemplate template});

  $ReceiptTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
  }) {
    return _then(_$LoadedImpl(
      null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateCopyWith<$Res> get template {
    return $ReceiptTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.template);

  @override
  final ReceiptTemplate template;

  @override
  String toString() {
    return 'ReceiptTemplateState.loaded(template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, template);

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
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loaded(template);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(template);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(template);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
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
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
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
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ReceiptTemplateState {
  const factory _Loaded(final ReceiptTemplate template) = _$LoadedImpl;

  ReceiptTemplate get template;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailedImplCopyWith<$Res> {
  factory _$$LoadFailedImplCopyWith(
          _$LoadFailedImpl value, $Res Function(_$LoadFailedImpl) then) =
      __$$LoadFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadFailedImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$LoadFailedImpl>
    implements _$$LoadFailedImplCopyWith<$Res> {
  __$$LoadFailedImplCopyWithImpl(
      _$LoadFailedImpl _value, $Res Function(_$LoadFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoadFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFailedImpl implements _LoadFailed {
  const _$LoadFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReceiptTemplateState.loadFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      __$$LoadFailedImplCopyWithImpl<_$LoadFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loadFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loadFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadFailed implements ReceiptTemplateState {
  const factory _LoadFailed(final String message) = _$LoadFailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
      _$ProcessingImpl _value, $Res Function(_$ProcessingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProcessingImpl implements _Processing {
  const _$ProcessingImpl();

  @override
  String toString() {
    return 'ReceiptTemplateState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements ReceiptTemplateState {
  const factory _Processing() = _$ProcessingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReceiptTemplateState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ReceiptTemplateState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$ReceiptTemplateStateCopyWithImpl<$Res, _$FailureImpl>
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
    return 'ReceiptTemplateState.failure(message: $message)';
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
    required TResult Function(ReceiptTemplate template) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReceiptTemplate template)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReceiptTemplate template)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
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
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
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
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
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
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ReceiptTemplateState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
