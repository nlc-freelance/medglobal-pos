import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_api.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/request/create_register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/request/update_register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/response/register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApi _registerApi;

  RegisterRepositoryImpl(this._registerApi);

  @override
  Future<Either<Failure, PaginatedList<Register>>> getRegisters({required FilterList filters}) async {
    try {
      final responseDto = await _registerApi.getRegisters(filters: filters);

      return Right(responseDto.convert((item) => item.toDomain()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Register>> getRegister(int id) async {
    try {
      final responseDto = await _registerApi.getRegisterById(id);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Register>> createRegister(Register register) async {
    try {
      final requestDto = CreateRegisterDto.fromDomain(register);
      final responseDto = await _registerApi.createRegister(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Register>> updateRegister(Register register) async {
    try {
      final requestDto = UpdateRegisterDto.fromDomain(register);
      final responseDto = await _registerApi.updateRegister(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRegister(int id) async {
    try {
      return Right(await _registerApi.deleteRegister(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }
}
