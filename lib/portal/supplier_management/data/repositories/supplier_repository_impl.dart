import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier_list.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final SupplierApi supplierApi;

  SupplierRepositoryImpl(this.supplierApi);

  @override
  Future<List<Supplier>> getAllSuppliers() async {
    try {
      final response = await supplierApi.getAllSuppliers();
      final suppliers = response.map((dto) => dto.toEntity()).toList();
      return suppliers;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, SupplierPaginatedList>> getSuppliers(int page) async {
    try {
      final response = await supplierApi.getSuppliers(page);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Supplier>> getSupplierById(int id) async {
    try {
      final supplier = await supplierApi.getSupplier(id);
      return Right(supplier.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> create(Supplier supplier) async {
    try {
      return Right(await supplierApi.create(supplier));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> update(int id, Supplier supplier) async {
    try {
      return Right(await supplierApi.update(id, supplier));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return Right(await supplierApi.delete(id));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
