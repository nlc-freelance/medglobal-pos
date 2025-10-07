import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:medglobal_admin_portal/amplifyconfiguration.dart';

Future<void> configureAmplify() async {
  try {
    // Define secure storage options
    final secureStorage = AmplifySecureStorage.factoryFrom(
      webOptions: WebSecureStorageOptions(
        persistenceOption: WebPersistenceOption.indexedDB,
      ),
    );

    final authPlugin = AmplifyAuthCognito(secureStorageFactory: secureStorage);
    await Amplify.addPlugin(authPlugin);

    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred while configuring Amplify: $e');
  }
}
