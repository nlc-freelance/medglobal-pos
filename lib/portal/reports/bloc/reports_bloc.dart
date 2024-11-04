import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/usecases/create_report_usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/usecases/get_report_by_id_usecase.dart';
import 'package:universal_html/html.dart' as html;

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final CreateReportUseCase _createReportUseCase;
  final GetReportByIdUseCase _getReportByIdUseCase;
  ReportsBloc(
    this._createReportUseCase,
    this._getReportByIdUseCase,
  ) : super(const ReportsInitial()) {
    on<CreateReportEvent>(create);
    on<StartReportGeneratePollingEvent>(startReportGeneratePolling);
    on<GetReportByIdEvent>(getReportById);
    on<DownloadReportEvent>(downloadReport);
  }

  bool _isPolling = false;

  Future<void> create(event, emit) async {
    final reportType = event.type;

    emit(ReportCreateLoading(reportType));

    try {
      final result = await _createReportUseCase.call(
        event.filters != null
            ? CreateReportParams(type: event.type, filters: event.filters)
            : CreateReportParams(type: event.type),
      );
      result.fold(
        (error) => emit(ReportError(reportType, message: error.message)),
        (data) => emit(ReportCreateSuccess(reportType, reportId: data.id!)),
      );
    } catch (e) {
      emit(ReportError(reportType, message: e.toString()));
    }
  }

  Future<void> startReportGeneratePolling(event, emit) async {
    final reportType = event.type;

    emit(ReportGeneratePolling(reportType));
    _isPolling = true;

    while (_isPolling) {
      emit(ReportGeneratePolling(reportType));
      try {
        final result = await _getReportByIdUseCase.call(GetReportByIdParams(event.id));
        result.fold(
          (error) => emit(ReportByIdError(reportType, message: error.message)),
          (data) {
            if (data.status == ReportStatus.COMPLETED) {
              // Stop polling after receiving completed
              _isPolling = false;
              emit(ReportByIdSuccess(reportType, report: data));
              emit(ReportGeneratePollingCompleted(reportType));
            }
          },
        );
      } catch (e) {
        emit(ReportByIdError(reportType, message: e.toString()));
      }

      // If still polling, wait before the next request
      if (_isPolling) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }
  }

  Future<void> getReportById(event, emit) async {
    final reportType = event.type;

    emit(ReportByIdLoading(reportType));

    try {
      final result = await _getReportByIdUseCase.call(GetReportByIdParams(event.id));
      result.fold(
        (error) => emit(ReportByIdError(reportType, message: error.message)),
        (data) => emit(ReportByIdSuccess(reportType, report: data)),
      );
    } catch (e) {
      emit(ReportByIdError(reportType, message: e.toString()));
    }
  }

  Future<void> downloadReport(event, emit) async {
    final reportType = event.type;

    emit(ReportDownloading(reportType));

    try {
      final fileName = Uri.parse(event.fileUrl).pathSegments.first;

      final anchor = html.AnchorElement(href: event.fileUrl)
        ..setAttribute('download', fileName)
        ..setAttribute('target', '_blank')
        ..click();

      anchor.remove();

      emit(ReportDownloaded(reportType));
    } catch (e) {
      emit(ReportByIdError(reportType, message: e.toString()));
    }
  }
}
