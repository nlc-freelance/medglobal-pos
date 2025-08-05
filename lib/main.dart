import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/medglobal_portal_app.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // Ensure Flutter widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes the HydratedStorage for state persistence.
  // Uses web-specific storage if on the web, otherwise uses application document directory.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  // Configures AWS Amplify services.
  await configureAmplify();

  // Initializes platform-specific dependencies:
  // - Web: initDependencyInjection()
  // - Desktop: initDesktopDependencies()
  kIsWeb ? initDependencyInjection() : initDesktopDependencies();

  // Sets a global observer for all Blocs to log events, transitions, and errors.
  Bloc.observer = AppBlocObserver();

  // Removes hash (#) from URL paths on the web for cleaner URLs.
  usePathUrlStrategy();

  runApp(const MedGlobaPortalApp());
}
