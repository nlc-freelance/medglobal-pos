import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/api/branch_api_service.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_payload.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';

/// Concrete implementation of [BranchRepository] that uses [BranchApiService] for API calls
/// and [BaseRepository] to centralize error handling.
class BranchRepositoryImpl extends BaseRepository implements BranchRepository {
  final BranchApiService _api;

  BranchRepositoryImpl({required BranchApiService api}) : _api = api;

  @override
  Future<Either<Failure, PaginatedList<Branch>>> getBranches(PageQuery query) async {
    return call(() async {
      final response = await _api.getBranches(query);
      return response.convert((dto) => BranchMapper.fromDto(dto));
    });
  }

  @override
  Future<Either<Failure, Branch>> getBranch(int id) async {
    return call(() async {
      final response = await _api.getBranchById(id);
      return BranchMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, Branch>> createBranch(BranchPayload payload) async {
    return call(() async {
      final response = await _api.createBranch(payload);
      return BranchMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, Branch>> updateBranch(int id, BranchPayload payload) async {
    return call(() async {
      final response = await _api.updateBranch(id, payload);
      return BranchMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, void>> deleteBranch(int id) async {
    return call(() async => await _api.deleteBranch(id));
  }

  @override
  Future<Either<Failure, ReceiptConfiguration>> getReceiptConfigurationByBranchId(int id) async {
    return call(() async => await _api.getReceiptConfigurationByBranchId(id));
  }

  @override
  Future<Either<Failure, PaginatedList<BranchPartial>>> getBranchesPartial(PageQuery query) {
    return call(() async {
      final response = await _api.getBranchesPartial(query);
      return response.convert((dto) => BranchPartialMapper.fromDto(dto));
    });
  }
}
