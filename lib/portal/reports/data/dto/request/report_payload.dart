import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'report_payload.freezed.dart';

@freezed
class ReportPayload with _$ReportPayload {
  const factory ReportPayload({
    required String type,
    Map<String, dynamic>? filters,
    int? userId,
    Map<String, dynamic>? payload,
  }) = _ReportPayload;
}

extension ReportPayloadExt on ReportPayload {
  /// Custom [toJson] method that conditionally includes fields and structures
  /// the output JSON based on the specific report type.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {'type': type};

    final reportType = ReportType.fromString(type);

    /// For sales reports, include the userId with JSON key `userId`
    if (reportType == ReportType.sales && userId != null) {
      json['userId'] = userId;
    }

    /// For filterable reports, pass the data as is
    if (ReportType.filterable.contains(reportType)) {
      final cleanFilters = filters.removeNullValues();
      if (cleanFilters.isNotEmpty) {
        json.addAll(cleanFilters);
      }
    }

    /// For product performance reports, wrap the data inside the JSON key `payload`
    if (reportType.isProductPerformance) {
      final cleanPayload = payload.removeNullValues();
      if (cleanPayload.isNotEmpty) {
        json['payload'] = cleanPayload;
      }
    }

    return json;
  }
}
