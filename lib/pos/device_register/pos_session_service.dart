import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/pos_session.dart';

// class PosSessionService {
//   PosSession? _session;
//
//   void setSession(PosSession session) => _session = session;
//   void clear() => _session = null;
//
//   int? get userId => _session?.employeeId;
//   int? get registerId => _session?.registerId;
//   int? get branchId => _session?.branchId;
//
//   PosSession? get value => _session;
// }

/// POS app session
class UserSessionService {
  User? _user;
  Register? _register;
  BranchPartial? _branch;

  void setUser(User user) => _user = user;
  void upsertUserAndRegister(User user, Register register, BranchPartial branch) {
    _user = user;
    _register = register;
    _branch = branch;
  }

  void clear() {
    _user = null;
    _register = null;
    _branch = null;
  }

  int? get userId => _user?.id;
  int? get registerId => _register?.id;
  int? get branchId => _branch?.id;

  User? get user => _user;
  Register? get register => _register;
  BranchPartial? get branch => _branch;
}

typedef SessionContext = ({int userId, int registerId});

Either<Failure, SessionContext> resolveSession(UserSessionService session) {
  final userId = session.userId;
  final registerId = session.registerId;

  if (userId == null || registerId == null) {
    return Left(UserNotFoundFailure('User and/or register details not found.'));
  }

  return Right((userId: userId, registerId: registerId));
}
