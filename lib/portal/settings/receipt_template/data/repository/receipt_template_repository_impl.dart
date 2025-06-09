import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/api/receipt_template_api.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/request/create_receipt_template_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/request/update_receipt_template_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';

class ReceiptTemplateRepositoryImpl implements ReceiptTemplateRepository {
  final ReceiptTemplateApi _registerApi;

  ReceiptTemplateRepositoryImpl(this._registerApi);

  @override
  Future<Either<Failure, PaginatedList<ReceiptTemplate>>> getReceiptTemplates({required PageQuery filters}) async {
    try {
      final responseDto = await _registerApi.getReceiptTemplates(filters: filters);

      return Right(responseDto.convert((item) => item.toDomain()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ReceiptTemplate>> getReceiptTemplate(int id) async {
    try {
      final responseDto = await _registerApi.getReceiptTemplateById(id);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ReceiptTemplate>> createReceiptTemplate(ReceiptTemplate register) async {
    try {
      final requestDto = CreateReceiptTemplateDto.fromDomain(register);
      final responseDto = await _registerApi.createReceiptTemplate(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ReceiptTemplate>> updateReceiptTemplate(ReceiptTemplate register) async {
    try {
      final requestDto = UpdateReceiptTemplateDto.fromDomain(register);
      final responseDto = await _registerApi.updateReceiptTemplate(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReceiptTemplate(int id) async {
    try {
      return Right(await _registerApi.deleteReceiptTemplate(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }
}
