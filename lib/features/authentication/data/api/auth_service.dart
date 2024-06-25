import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:medglobal_admin_portal/features/authentication/data/dto/user_dto.dart';

/// Authentication via AWS Amplify
class AuthService {
  Future<SignInResult> login(String email, String password) async => await Amplify.Auth.signIn(
        username: email,
        password: password,
      );

  Future<SignInResult> confirmLoginWithNewPassword(String password) async =>
      await Amplify.Auth.confirmSignIn(confirmationValue: password);

  Future<CognitoAuthSession> getAuthSession() async => await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;

  Future<String> getToken() async {
    final auth = await getAuthSession();
    return auth.userPoolTokensResult.value.accessToken.encode();
  }

  Future<UserDto> getFullName() async {
    final attributes = await Amplify.Auth.fetchUserAttributes();

    String givenName = '';
    String familyName = '';

    for (final attribute in attributes) {
      if (attribute.userAttributeKey == AuthUserAttributeKey.givenName) givenName = attribute.value;
      if (attribute.userAttributeKey == AuthUserAttributeKey.familyName) familyName = attribute.value;
    }

    return UserDto(givenName: givenName, familyName: familyName);
  }

  Future<void> logout() async => await Amplify.Auth.signOut();
}
