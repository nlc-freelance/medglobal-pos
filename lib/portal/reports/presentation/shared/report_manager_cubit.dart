import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/report_payload.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report_task.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';

part 'report_manager_state.dart';
part 'report_manager_cubit.freezed.dart';

/// A global Cubit that manages the lifecycle of report generation tasks,
/// including creation, polling for status, and triggering downloads.
class ReportManagerCubit extends Cubit<ReportManagerState> {
  final ReportRepository _repository;

  ReportManagerCubit({required ReportRepository repository})
      : _repository = repository,
        super(const ReportManagerState());

  String generateTaskKey(int id, ReportType type) => '$id-${type.value}';

  /// Initiates the report creation and generation process.
  ///
  /// Adds a temporary task to the state immediately for UI feedback,
  /// then calls the backend to get the actual taskId and starts polling.
  Future<void> generateReport(ReportPayload payload, {bool autoDownload = true}) async {
    final type = ReportType.fromString(payload.type);

    final tempTaskId = -DateTime.now().microsecondsSinceEpoch;
    final tempTaskKey = '${generateTaskKey(tempTaskId, type)}-temp';

    final tempTask = ReportTask(
      id: tempTaskId,
      key: tempTaskKey,
      type: type,
      status: ReportTaskStatus.creating,
      fileName: '${DateTime.now()}_${type.value}.csv',
    );

    _addTaskToState(tempTask);

    try {
      final result = await _repository.createReport(payload);

      result.fold(
        (failure) => _updateTaskInState(
          tempTaskKey,
          (task) => task.copyWith(
            status: ReportTaskStatus.failure,
            error: 'Failed to generate ${task.type.value}. ${failure.message}',
          ),
        ),
        (report) {
          final newTaskKey = generateTaskKey(report.id, type);
          _updateTaskInState(
            tempTaskKey,
            (task) => task.copyWith(
              id: report.id,
              key: newTaskKey,
              status: ReportTaskStatus.polling,
              fileName: report.fileName,
            ),
          );

          _startPolling(report.id, newTaskKey, autoDownload);
        },
      );
    } catch (e) {
      _updateTaskInState(
        tempTaskKey,
        (task) => task.copyWith(
          status: ReportTaskStatus.failure,
          error: 'An unexpected error occured. Failed to generate ${task.type.value}. ${e.toString()}',
        ),
      );
    }
  }

  /// Starts polling for the status of a specific report.
  ///
  /// This method sets up a periodic timer to check the report status with the backend.
  void _startPolling(int reportId, String taskKey, bool autoDownload) {
    // Cancel any existing timer for this task if it somehow exists (e.g., re-trigger)
    _getTaskByKey(taskKey)?.pollingTimer?.cancel();

    final Timer timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final result = await _repository.getReport(reportId);

        result.fold(
          (failure) {
            timer.cancel(); // Stop polling on failure
            _updateTaskInState(
              taskKey,
              (task) => task.copyWith(
                status: ReportTaskStatus.failure,
                error: 'Failed to generate ${task.type.value}. ${failure.message}',
                pollingTimer: null,
              ),
            );
          },
          (report) {
            if (report.status == ReportStatus.completed) {
              timer.cancel(); // Stop polling once ready
              _updateTaskInState(
                taskKey,
                (task) => task.copyWith(
                  status: ReportTaskStatus.ready,
                  fileUrl: report.fileUrl,
                  pollingTimer: null,
                ),
              );
              // Trigger download immediately after it's completed, only for contextual reports
              // if (!report.type.isDownloadManual) downloadReport(taskKey);
              if (autoDownload) _downloadReport(taskKey);
            }
          },
        );
      } catch (e) {
        timer.cancel(); // Stop polling on error
        _updateTaskInState(
          taskKey,
          (task) => task.copyWith(
            status: ReportTaskStatus.failure,
            error: 'An unexpected error occured. Failed to generate ${task.type.value}. ${e.toString()}',
            pollingTimer: null,
          ),
        );
      }
    });

    // Store the timer reference within the ReportTask for proper management
    _updateTaskInState(taskKey, (task) => task.copyWith(pollingTimer: timer));
  }

  /// Downloads the generated report for the given [taskKey].
  ///
  /// This method uses a browser-triggered download, `dart:html` to create and click an anchor element,
  /// allowing file download in Flutter Web.
  void _downloadReport(String taskKey) {
    final ReportTask? taskToDownload = _getTaskByKey(taskKey);
    final type = taskKey.split('-').last;

    if (taskToDownload == null) {
      _updateTaskInState(
          taskKey,
          (task) => task.copyWith(
                status: ReportTaskStatus.failure,
                error: 'Failed to download $type. Report not found.',
              ));
      return;
    }

    if (taskToDownload.status != ReportTaskStatus.ready || taskToDownload.fileUrl == null) {
      _updateTaskInState(
        taskKey,
        (task) => task.copyWith(
          status: ReportTaskStatus.failure,
          error: '$type download URL is missing.',
        ),
      );
      return;
    }

    _updateTaskInState(taskKey, (task) => task.copyWith(status: ReportTaskStatus.downloading));

    try {
      final fileUrl = taskToDownload.fileUrl!;
      _repository.downloadReport(fileUrl);

      removeTask(taskKey);
    } catch (e) {
      _updateTaskInState(
        taskKey,
        (task) => task.copyWith(
          status: ReportTaskStatus.failure,
          error: 'An unexpected error occured. Failed to download $type. ${e.toString()}',
        ),
      );
    }
  }

  /// Trigger download manually from a list of already generated reports from the backend.
  void manualDownloadReport(Report report) {
    final taskKey = generateTaskKey(report.id, report.type);

    //  Create a new task if report is from the response of `getReports`
    if (!state.tasks.any((task) => task.key == taskKey)) {
      final newTask = ReportTask(
        id: report.id,
        key: taskKey,
        type: report.type,
        status: ReportTaskStatus.ready,
        fileName: report.fileName,
        fileUrl: report.fileUrl,
        fromRemoteDB: true,
      );

      _addTaskToState(newTask);
    }

    _downloadReport(taskKey);
  }

  /// Helper method to add new task in state.
  void _addTaskToState(ReportTask task) {
    final updatedTasks = [...state.tasks, task];
    emit(state.copyWith(tasks: updatedTasks));
  }

  /// Helper method to find and update a [ReportTask] in the state.
  void _updateTaskInState(String key, ReportTask Function(ReportTask) updateFn) {
    final updatedTasks = state.tasks.map((task) {
      if (task.key == key) return updateFn(task);
      return task;
    }).toList();

    emit(state.copyWith(tasks: updatedTasks));
  }

  /// Helper to get a task by [key].
  ReportTask? _getTaskByKey(String key) {
    return state.tasks.firstWhereOrNull((task) => task.key == key);
  }

  /// Helper to remove a task by [key].
  void removeTask(String key) {
    final updatedTasks = state.tasks.where((task) => task.key != key).toList();
    emit(state.copyWith(tasks: updatedTasks));
  }

  /// Resets the cubit's state, cancelling all ongoing polling tasks.
  /// This should be called on application-level events like user logout.
  void reset() {
    // Cancel all active timers for tasks
    for (final task in state.tasks) {
      task.pollingTimer?.cancel();
    }
    // Reset the state to its initial empty state
    emit(const ReportManagerState());
  }

  @override
  Future<void> close() {
    // Ensure all timers are cancelled as a final safeguard before disposal.
    // This calls the same logic as reset() for timers.
    for (final task in state.tasks) {
      task.pollingTimer?.cancel();
    }
    return super.close();
  }
}
