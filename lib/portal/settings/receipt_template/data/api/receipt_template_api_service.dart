import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_dto.dart';

class ReceiptTemplateApiService {
  final BaseApiService _api;

  ReceiptTemplateApiService(this._api);

  Future<PaginatedList<ReceiptTemplateDto>> getReceiptTemplates(PageQuery query) async {
    final response = await _api.getPaginated<ReceiptTemplateDto>(
      ApiEndpoints.receiptTemplates,
      queryParams: query.toJson(),
      fromJson: ReceiptTemplateDto.fromJson,
    );

    return PaginatedList<ReceiptTemplateDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<ReceiptTemplateDto> getReceiptTemplateById(int id) async {
    final response = await _api.get(
      ApiEndpoints.receiptTemplateById(id),
      fromJson: ReceiptTemplateDto.fromJson,
    );
    return response.data;
  }

  Future<ReceiptTemplateDto> createReceiptTemplate(ReceiptTemplatePayload payload) async {
    final response = await _api.post(
      ApiEndpoints.receiptTemplates,
      data: payload.toJson(),
      fromJson: ReceiptTemplateDto.fromJson,
    );
    return response.data;
  }

  Future<ReceiptTemplateDto> updateReceiptTemplate(int id, ReceiptTemplatePayload payload) async {
    final response = await _api.update(
      ApiEndpoints.receiptTemplateById(id),
      data: payload.toJson(),
      fromJson: ReceiptTemplateDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteReceiptTemplate(int id) async {
    return await _api.delete(ApiEndpoints.receiptTemplateById(id));
  }
}
