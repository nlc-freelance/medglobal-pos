import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/api/branch1_api.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/create_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/update_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch1_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch1.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch1_repository.dart';

class Branch1RepositoryImpl implements Branch1Repository {
  final Branch1Api _branch1api;

  Branch1RepositoryImpl(this._branch1api);

  @override
  Future<Either<Failure, PaginatedList<Branch1>>> getBranches({int? page, int? size}) async {
    try {
      final responseDto = await _branch1api.getBranches(page: page, size: size);

      return Right(responseDto.convert((item) => item.toDomain()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Branch1>> getBranch(int id) async {
    try {
      final responseDto = await _branch1api.getBranchById(id);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Branch1>> createBranch(Branch1 branch) async {
    try {
      final requestDto = CreateBranchDto.fromDomain(branch);
      final responseDto = await _branch1api.createBranch(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Branch1>> updateBranch(Branch1 branch) async {
    try {
      final requestDto = UpdateBranchDto.fromDomain(branch);
      final responseDto = await _branch1api.updateBranch(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBranch(int id) async {
    try {
      return Right(await _branch1api.deleteBranch(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }
}
