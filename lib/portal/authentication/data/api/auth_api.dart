import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/dto/login_response_dto.dart';

abstract class AuthApi {
  Future<LoginResponseDto> login(String email, String password);
  Future<LoginResponseDto> confirmLoginWithNewPassword(String password);
  Future<LoginResponseDto> getAuthSession();
  Future<void> logout();
}

class AuthApiImpl implements AuthApi {
  final AuthService amplify;

  AuthApiImpl(this.amplify);

  @override
  Future<LoginResponseDto> login(String email, String password) async {
    try {
      final response = await amplify.login(email, password);
      if (response.nextStep.signInStep == AuthSignInStep.confirmSignInWithNewPassword) {
        return const LoginResponseDto(isFirstTimeLogin: true);
      } else {
        final user = await amplify.getUserDto();

        /// Check if user has access role assigned and if it is accepted, if not or null logout the user and show error
        if (user.mapUserType() != null) {
          return LoginResponseDto(
            user: user,
            isLoggedIn: response.isSignedIn,
          );
        } else {
          await amplify.logout();
          throw 'Your account does not have the necessary user type for access.';
        }
      }
    } on CognitoServiceException catch (e) {
      throw e.message;
    } catch (e) {
      if (e.toString().contains('No password given')) throw 'No password given.';
      rethrow;
    }
  }

  @override
  Future<LoginResponseDto> confirmLoginWithNewPassword(String password) async {
    try {
      final response = await amplify.confirmLoginWithNewPassword(password);
      final user = await amplify.getUserDto();
      return LoginResponseDto(
        user: user,
        isLoggedIn: response.isSignedIn,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseDto> getAuthSession() async {
    try {
      final response = await amplify.getAuthSession();
      if (response.isSignedIn) {
        final user = await amplify.getUserDto();
        return LoginResponseDto(
          user: user,
          isLoggedIn: response.isSignedIn,
        );
      } else {
        return LoginResponseDto(isLoggedIn: response.isSignedIn);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      return await amplify.logout();
    } catch (_) {
      rethrow;
    }
  }
}
