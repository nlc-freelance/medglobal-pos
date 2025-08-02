import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_payload.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final SupplierApi _api;

  SupplierRepositoryImpl({required SupplierApi api}) : _api = api;

  @override
  Future<Either<Failure, PaginatedList<Supplier>>> getSuppliers(PageQuery query) async {
    try {
      final responseDto = await _api.getSuppliers(query);
      return Right(responseDto.convert((item) => item.toDomain()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Supplier>> getSupplierById(int id) async {
    try {
      final supplier = await _api.getSupplier(id);
      return Right(supplier.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Supplier>> createSupplier(SupplierPayload payload) async {
    try {
      final response = await _api.create(payload);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Supplier>> updateSupplier(int id, SupplierPayload payload) async {
    try {
      final response = await _api.update(id, payload);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSupplier(int id) async {
    try {
      return Right(await _api.delete(id));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
