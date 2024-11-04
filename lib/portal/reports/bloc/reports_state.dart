part of 'reports_bloc.dart';

sealed class ReportsState extends Equatable {
  const ReportsState();

  @override
  List<Object> get props => [];
}

final class ReportsInitial extends ReportsState {
  const ReportsInitial();
}

final class ReportCreateLoading extends ReportsState {
  final ReportType type;
  const ReportCreateLoading(this.type);

  @override
  List<Object> get props => [type];
}

final class ReportCreateSuccess extends ReportsState {
  final ReportType type;
  final int reportId;
  const ReportCreateSuccess(this.type, {required this.reportId});

  @override
  List<Object> get props => [type, reportId];
}

final class ReportGeneratePolling extends ReportsState {
  final ReportType type;
  const ReportGeneratePolling(this.type);

  @override
  List<Object> get props => [type];
}

final class ReportGeneratePollingCompleted extends ReportsState {
  final ReportType type;
  const ReportGeneratePollingCompleted(this.type);

  @override
  List<Object> get props => [type];
}

final class ReportError extends ReportsState {
  final ReportType type;
  final String message;
  const ReportError(this.type, {required this.message});

  @override
  List<Object> get props => [type, message];
}

final class ReportByIdLoading extends ReportsState {
  final ReportType type;
  const ReportByIdLoading(this.type);

  @override
  List<Object> get props => [type];
}

final class ReportByIdSuccess extends ReportsState {
  final ReportType type;
  final Report report;
  const ReportByIdSuccess(this.type, {required this.report});

  @override
  List<Object> get props => [type, report];
}

final class ReportDownloading extends ReportsState {
  final ReportType type;
  const ReportDownloading(this.type);

  @override
  List<Object> get props => [type];
}

final class ReportDownloaded extends ReportsState {
  final ReportType type;
  const ReportDownloaded(this.type);

  @override
  List<Object> get props => [type];
}

final class ReportByIdError extends ReportsState {
  final ReportType type;
  final String message;
  const ReportByIdError(this.type, {required this.message});

  @override
  List<Object> get props => [type, message];
}
