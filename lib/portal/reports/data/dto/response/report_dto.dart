import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';

part 'report_dto.freezed.dart';
part 'report_dto.g.dart';

@freezed
class ReportDto with _$ReportDto {
  const factory ReportDto({
    required int id,
    required String type,
    required String status,
    String? fileUrl,
    required String fileName,
    int? userId,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _ReportDto;

  factory ReportDto.fromJson(Map<String, dynamic> json) => _$ReportDtoFromJson(json);
}

extension ReportDtoExt on ReportDto {
  Report toDomain() => Report(
        id: id,
        type: ReportType.fromString(type),
        status: ReportStatus.fromString(status),
        fileUrl: fileUrl,
        fileName: fileName,
        userId: userId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
