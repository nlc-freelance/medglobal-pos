import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'report.freezed.dart';

@freezed
class Report with _$Report {
  const factory Report({
    required int id,
    required ReportType type,
    required ReportStatus status,
    String? fileUrl,
    required String fileName,
    int? userId,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _Report;
}

extension ReportExt on Report {
  DataGridRow toProductPerformanceDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: fileName),
          DataGridCell<ReportStatus>(columnName: 'action', value: status),
        ],
      );
}
