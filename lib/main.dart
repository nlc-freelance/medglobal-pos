import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/medglobal_portal_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  initDependencyInjection();

  Bloc.observer = AppBlocObserver();

  usePathUrlStrategy();

  runApp(const MedGlobaPortalApp());
}
