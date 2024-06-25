import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:medglobal_admin_portal/core/core.dart';

Future<void> configureAmplify() async {
  try {
    final authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugin(authPlugin);

    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred while configuring Amplify: $e');
  }
}
