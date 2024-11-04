import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';

part 'report_dto.g.dart';

@JsonSerializable()
class ReportDto {
  final int? id;
  final String? type;
  final String? status;
  final String? fileUrl;
  final int? userId;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const ReportDto({
    this.id,
    this.type,
    this.status,
    this.fileUrl,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory ReportDto.fromJson(Map<String, dynamic> json) => _$ReportDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDtoToJson(this);

  Report toEntity() => Report(
        id: id,
        type: _type,
        status: _status,
        fileUrl: fileUrl,
        userId: userId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  ReportType? get _type {
    switch (type) {
      case 'PRODUCT_DATA_CSV':
        return ReportType.PRODUCT_DATA_CSV;
      case 'PURCHASE_ORDER_CSV':
        return ReportType.PURCHASE_ORDER_CSV;
      case 'STOCK_RETURN_CSV':
        return ReportType.STOCK_RETURN_CSV;
      case 'STOCK_TRANSFER_CSV':
        return ReportType.STOCK_TRANSFER_CSV;
      case 'STOCK_TAKE_CSV':
        return ReportType.STOCK_TAKE_CSV;
      default:
        return null;
    }
  }

  ReportStatus get _status => status == 'completed' ? ReportStatus.COMPLETED : ReportStatus.PENDING;
}
