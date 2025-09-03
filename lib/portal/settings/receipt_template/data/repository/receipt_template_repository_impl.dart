import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/api/receipt_template_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';

/// Concrete implementation of [ReceiptTemplateRepository] that uses [ReceiptTemplateApiService] for API calls
/// and [BaseRepository] to centralize error handling.
class ReceiptTemplateRepositoryImpl extends BaseRepository implements ReceiptTemplateRepository {
  final ReceiptTemplateApiService _api;

  ReceiptTemplateRepositoryImpl({required ReceiptTemplateApiService api}) : _api = api;

  @override
  Future<Either<Failure, PaginatedList<ReceiptTemplate>>> getReceiptTemplates(PageQuery query) async {
    return call(() async {
      final data = await _api.getReceiptTemplates(query);
      final paginatedReceiptTemplates = data.convert((dto) => ReceiptTemplateMapper.fromDto(dto));

      return paginatedReceiptTemplates;
    });
  }

  @override
  Future<Either<Failure, ReceiptTemplate>> getReceiptTemplate(int id) async {
    return call(() async {
      final data = await _api.getReceiptTemplateById(id);
      return ReceiptTemplateMapper.fromDto(data);
    });
  }

  @override
  Future<Either<Failure, ReceiptTemplate>> createReceiptTemplate(ReceiptTemplatePayload payload) async {
    return call(() async {
      final data = await _api.createReceiptTemplate(payload);
      return ReceiptTemplateMapper.fromDto(data);
    });
  }

  @override
  Future<Either<Failure, ReceiptTemplate>> updateReceiptTemplate(int id, ReceiptTemplatePayload payload) async {
    return call(() async {
      final data = await _api.updateReceiptTemplate(id, payload);
      return ReceiptTemplateMapper.fromDto(data);
    });
  }

  @override
  Future<Either<Failure, void>> deleteReceiptTemplate(int id) async {
    return call(() async => await _api.deleteReceiptTemplate(id));
  }
}
