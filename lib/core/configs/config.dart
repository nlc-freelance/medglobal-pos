import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  const EnvConfig._();

  static const String _devUrl = 'https://awimrjguq7.execute-api.ap-southeast-1.amazonaws.com/dev';

  static String get baseUrl => dotenv.env['BASE_URL'] ?? _devUrl;
  static String get envPrefix => dotenv.env['ENV_NAME'] ?? 'dev';
  static String get version => dotenv.env['VERSION'] ?? '0.0.0';
  static String get buildNumber => dotenv.env['BUILD_NUMBER'] ?? '0';
}
