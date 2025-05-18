import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/api/branch_api.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/create_branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/request/update_branch_dto.dart';

class BranchRepositoryImpl implements BranchRepository {
  final BranchApi _branchApi;

  BranchRepositoryImpl(this._branchApi);

  @override
  Future<Either<Failure, PaginatedList<Branch>>> getBranches({int? page, int? size}) async {
    try {
      final responseDto = await _branchApi.getBranches(page: page, size: size);

      return Right(responseDto.convert((item) => item.toDomain()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Branch>> getBranch(int id) async {
    try {
      final responseDto = await _branchApi.getBranchById(id);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Branch>> createBranch(Branch branch) async {
    try {
      final requestDto = CreateBranchDto.fromDomain(branch);
      final responseDto = await _branchApi.createBranch(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }

  @override
  Future<Either<Failure, Branch>> updateBranch(Branch branch) async {
    try {
      final requestDto = UpdateBranchDto.fromDomain(branch);
      final responseDto = await _branchApi.updateBranch(requestDto);

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
      return Right(await _branchApi.deleteBranch(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.messsage));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.messsage));
    }
  }
}
