part of 'access_validation_bloc.dart';

@freezed
class AccessValidationEvent with _$AccessValidationEvent {
  const factory AccessValidationEvent.started(int userId) = _Started;
}
