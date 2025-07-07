import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/request/create_receipt_template_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/request/update_receipt_template_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/response/receipt_template_dto.dart';

class ReceiptTemplateApi {
  final BaseApiService _api;

  ReceiptTemplateApi(this._api);

  Future<PaginatedList<ReceiptTemplateDto>> getReceiptTemplates({required PageQuery filters}) async {
    final response = await _api.getPaginated<ReceiptTemplateDto>(
      ApiEndpoints.receiptTemplates,
      queryParams: filters.toJson(),
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

  Future<ReceiptTemplateDto> createReceiptTemplate(CreateReceiptTemplateDto dto) async {
    final response = await _api.post(
      ApiEndpoints.receiptTemplates,
      data: dto.toJson(),
      fromJson: ReceiptTemplateDto.fromJson,
    );
    return response.data;
  }

  Future<ReceiptTemplateDto> updateReceiptTemplate(UpdateReceiptTemplateDto dto) async {
    final response = await _api.update(
      ApiEndpoints.receiptTemplateById(dto.id),
      data: dto.toJson(),
      fromJson: ReceiptTemplateDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteReceiptTemplate(int id) async {
    return await _api.delete(ApiEndpoints.receiptTemplateById(id));
  }
}
