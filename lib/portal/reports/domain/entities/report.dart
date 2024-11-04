import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  final int? id;
  final ReportType? type;
  final ReportStatus? status;
  final String? fileUrl;
  final int? userId;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const Report({
    this.id,
    this.type,
    this.status,
    this.fileUrl,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);

  @override
  String toString() {
    return 'Report{id: $id, type: $type, status: $status, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
