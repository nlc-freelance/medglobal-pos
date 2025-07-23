part of 'product_performance_list_bloc.dart';

@freezed
class ProductPerformanceListEvent with _$ProductPerformanceListEvent {
  const factory ProductPerformanceListEvent.getReports({required PageQuery query}) = _GetProductPerformanceReports;
  const factory ProductPerformanceListEvent.addReport(Report report) = _AddReport;
  const factory ProductPerformanceListEvent.updateReport(int id, Report Function(Report report) update) = _UpdateReport;
  const factory ProductPerformanceListEvent.removeReport(int id) = _RemoveReport;
}
