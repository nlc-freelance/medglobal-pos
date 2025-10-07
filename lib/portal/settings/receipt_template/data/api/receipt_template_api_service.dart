import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_dto.dart';

class ReceiptTemplateApiService {
  final ApiService _api;

  ReceiptTemplateApiService({required ApiService api}) : _api = api;

  Future<PaginatedList<ReceiptTemplateDto>> getReceiptTemplates(PageQuery query) async {
    final data = await _api.getPaginated<ReceiptTemplateDto>(
      ApiEndpoints.receiptTemplates,
      queryParams: query.toJson(),
      parser: (json) => parse(json, ReceiptTemplateDto.fromJson),
    );

    return PaginatedList<ReceiptTemplateDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<ReceiptTemplateDto> getReceiptTemplateById(int id) async {
    final data = await _api.get(
      ApiEndpoints.receiptTemplateById(id),
      parser: (json) => parse(json, ReceiptTemplateDto.fromJson),
    );
    return data;
  }

  Future<ReceiptTemplateDto> createReceiptTemplate(ReceiptTemplatePayload payload) async {
    final data = await _api.post(
      ApiEndpoints.receiptTemplates,
      data: payload.toJson(),
      parser: (json) => parse(json, ReceiptTemplateDto.fromJson),
    );
    return data;
  }

  Future<ReceiptTemplateDto> updateReceiptTemplate(int id, ReceiptTemplatePayload payload) async {
    final data = await _api.update(
      ApiEndpoints.receiptTemplateById(id),
      data: payload.toJson(),
      parser: (json) => parse(json, ReceiptTemplateDto.fromJson),
    );
    return data;
  }

  Future<void> deleteReceiptTemplate(int id) async {
    return await _api.delete(ApiEndpoints.receiptTemplateById(id));
  }
}
