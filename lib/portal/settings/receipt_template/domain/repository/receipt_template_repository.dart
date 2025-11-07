import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

abstract class ReceiptTemplateRepository {
  /// Retrieves a list of all receipt templates
  Future<ApiResult<PaginatedList<ReceiptTemplate>>> getReceiptTemplates(PageQuery filters);

  /// Retrieves a receipt template by [id]
  Future<ApiResult<ReceiptTemplate>> getReceiptTemplate(int id);

  /// Creates a new receipt template
  Future<ApiResult<ReceiptTemplate>> createReceiptTemplate(ReceiptTemplatePayload payload);

  /// Updates an existing receipt template
  Future<ApiResult<ReceiptTemplate>> updateReceiptTemplate(int id, ReceiptTemplatePayload payload);

  /// Deletes a receipt template
  Future<ApiResult<void>> deleteReceiptTemplate(int id);
}
