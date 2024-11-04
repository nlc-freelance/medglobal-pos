part of 'reports_bloc.dart';

sealed class ReportsEvent extends Equatable {
  const ReportsEvent();

  @override
  List<Object?> get props => [];
}

class CreateReportEvent extends ReportsEvent {
  final ReportType type;
  final Map<String, dynamic>? filters;
  const CreateReportEvent(this.type, {this.filters});

  @override
  List<Object?> get props => [type, filters];
}

class StartReportGeneratePollingEvent extends ReportsEvent {
  final int id;
  final ReportType type;
  const StartReportGeneratePollingEvent(this.type, {required this.id});

  @override
  List<Object> get props => [id, type];
}

class GetReportByIdEvent extends ReportsEvent {
  final int id;
  final ReportType type;
  const GetReportByIdEvent(this.type, {required this.id});

  @override
  List<Object> get props => [id, type];
}

class DownloadReportEvent extends ReportsEvent {
  final String fileUrl;
  final ReportType type;

  const DownloadReportEvent(this.type, {required this.fileUrl});
  @override
  List<Object> get props => [fileUrl, type];
}
