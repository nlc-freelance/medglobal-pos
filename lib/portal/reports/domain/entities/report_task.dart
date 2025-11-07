import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';

part 'report_task.freezed.dart';

/// Represents a single report generation task, its status, and associated data.
/// This entity is used to track the progress of a report.
@freezed
class ReportTask with _$ReportTask {
  const factory ReportTask({
    required int id, // Report id
    required String key, // Used for lookup <id>-<type>
    required ReportType type,
    required ReportTaskStatus status,
    required String fileName,
    String? fileUrl,
    String? error,
    Timer? pollingTimer,
    @Default(false) fromRemoteDB,
  }) = _ReportTask;
}

enum ReportTaskStatus { initial, creating, polling, ready, downloading, success, failure }

extension ReportTaskExt on ReportTask {
  bool get isInCreationState => key.contains('temp');

  Report toReport(ReportStatus status) => Report(
        id: id,
        type: type,
        status: status,
        fileName: fileName,
        fileUrl: fileUrl,
      );
}
