import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/dto/user_dto.dart';

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

    // print(auth.userPoolTokensResult);
    return auth.userPoolTokensResult.value.idToken.encode();
  }

  Future<UserDto> getUserDto() async {
    final attributes = await Amplify.Auth.fetchUserAttributes();

    String givenName = '';
    String familyName = '';
    String? userType;

    for (final attribute in attributes) {
      if (attribute.userAttributeKey == const CognitoUserAttributeKey.custom('custom:access_controls')) {
        userType = attribute.value;
      }
      if (attribute.userAttributeKey == AuthUserAttributeKey.givenName) givenName = attribute.value;
      if (attribute.userAttributeKey == AuthUserAttributeKey.familyName) familyName = attribute.value;
    }

    return UserDto(givenName: givenName, familyName: familyName, type: userType);
  }

  Future<void> logout() async => await Amplify.Auth.signOut();
}
