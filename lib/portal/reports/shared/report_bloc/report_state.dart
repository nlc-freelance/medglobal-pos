part of 'report_bloc.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.loaded(Report report) = _Loaded;
  const factory ReportState.failure(String message) = _Failure;
}
