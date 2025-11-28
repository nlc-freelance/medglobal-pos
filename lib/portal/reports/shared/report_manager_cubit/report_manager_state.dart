part of 'report_manager_cubit.dart';

@freezed
class ReportManagerState with _$ReportManagerState {
  const factory ReportManagerState({
    @Default(<ReportTask>[]) List<ReportTask> tasks,
  }) = _ReportManagerState;
}

extension ReportManagerStateExt on ReportManagerState {
  /// Retrieves all product performance tasks
  List<ReportTask> get productPerformanceTasks => tasks.where((task) => task.type.isProductPerformance).toList();

  // /// Retrieves all failed tasks
  // List<ReportTask> get failedTasks => tasks.where((task) {
  //       return task.status == ReportTaskStatus.failure;
  //     }).toList();

  // /// Retrieves all tasks that failed during the creation phase
  // List<ReportTask> failedCreationTasks({bool Function(ReportTask task)? filter}) {
  //   return tasks.where((task) {
  //     final isFailed = task.status == ReportTaskStatus.failure || task.key.contains('temp');
  //     final passesCustomFilter = filter == null || filter(task);

  //     return isFailed && passesCustomFilter;
  //   }).toList();
  // }

  /// Retrieves all tasks that are polling
  // List<ReportTask> pollingTasks({bool Function(ReportTask task)? filter}) {
  //   return tasks.where((task) {
  //     final isPolling = task.status == ReportTaskStatus.polling;
  //     final passesCustomFilter = filter == null || filter(task);

  //     return isPolling && passesCustomFilter;
  //   }).toList();
  // }

  // /// Retrieves all tasks that are ready to download
  // List<ReportTask> get readyTasks => tasks.where((task) {
  //       return task.status == ReportTaskStatus.ready;
  //     }).toList();

  /// Retrieves all locally ready-to-download tasks (i.e., newly generated, not from `getReports`).
  /// Optionally accepts:
  /// [filter]: An additional custom filter function for more fine-grained control.
  // List<ReportTask> localReadyTasks({bool Function(ReportTask task)? filter}) {
  //   return tasks.where((task) {
  //     final isReady = task.status == ReportTaskStatus.ready && !task.fromRemoteDB;
  //     final passesCustomFilter = filter == null || filter(task);

  //     return isReady && passesCustomFilter;
  //   }).toList();
  // }
}

extension ReportTaskListExt on List<ReportTask> {
  /// Retrieves all failed tasks
  List<ReportTask> get failed => where((task) {
        return task.status == ReportTaskStatus.failure;
      }).toList();

  /// Retrieves all tasks that failed during the creation phase
  List<ReportTask> get failedCreation => where((task) {
        return task.status == ReportTaskStatus.failure && task.key.contains('temp');
      }).toList();

  /// Retrieves all tasks that are polling
  List<ReportTask> get polling => where((task) {
        return task.status == ReportTaskStatus.polling;
      }).toList();

  /// Retrieves all tasks that are ready to download
  List<ReportTask> get ready => where((task) {
        return task.status == ReportTaskStatus.ready;
      }).toList();

  /// Retrieves all active local tasks
  List<ReportTask> get local => where((task) {
        return !task.fromRemoteDB;
      }).toList();

  /// Retrieves all tasks created from remote (already generated from `getReports`)
  List<ReportTask> get remote => where((task) {
        return task.fromRemoteDB;
      }).toList();
}
