import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/api/tax_api.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/request/create_tax_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/request/update_tax_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/response/tax_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';

class TaxRepositoryImpl implements TaxRepository {
  final TaxApi _taxApi;

  TaxRepositoryImpl(this._taxApi);

  @override
  Future<Either<Failure, PaginatedList<Tax>>> getTaxCodes({required FilterList filters}) async {
    try {
      final responseDto = await _taxApi.getTaxCodes(filters: filters);

      return Right(responseDto.convert((item) => item.toDomain()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Tax>> getTaxCode(int id) async {
    try {
      final responseDto = await _taxApi.getTaxCodeById(id);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Tax>> createTaxCode(Tax tax) async {
    try {
      final requestDto = CreateTaxDto.fromDomain(tax);
      final responseDto = await _taxApi.createTaxCode(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Tax>> updateTaxCode(Tax tax) async {
    try {
      final requestDto = UpdateTaxDto.fromDomain(tax);
      final responseDto = await _taxApi.updateTaxCode(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTaxCode(int id) async {
    try {
      return Right(await _taxApi.deleteTaxCode(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Tax?>> getDefaultTaxCode() async {
    try {
      final responseDto = await _taxApi.getDefaultTaxCode();

      return Right(responseDto?.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }
}
