import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal_app.dart';
import 'package:medglobal_admin_portal/pos_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  // Ensure Flutter widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes the HydratedStorage for state persistence
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  // Configures AWS Amplify services.
  await configureAmplify();

  // Set a global observer for all Blocs to log events, transitions, and errors
  Bloc.observer = AppBlocObserver();

  if (kIsWeb) {
    // Removes hash (#) from URL paths on the web for cleaner URLs
    usePathUrlStrategy();

    // Initializes Portal dependencies
    initDependencyInjection();
  } else {
    // Initializes POS dependencies
    initDesktopDependencies();

    // Initialize the window manager
    await windowManager.ensureInitialized();

    // // Configure initial window options
    // WindowOptions windowOptions = const WindowOptions(title: "POS");
    //
    // windowManager.waitUntilReadyToShow(windowOptions, () async {
    //   // Maximize the window on launch
    //   await windowManager.maximize();
    //   await windowManager.setAsFrameless();
    //
    //   // Disable resizing
    //   await windowManager.setResizable(false);
    //
    //   // Show the window
    //   await windowManager.show();
    //   await windowManager.focus();
    // });
  }

  runApp(kIsWeb ? const PortalApp() : const PosApp());
}
