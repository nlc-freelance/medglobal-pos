class EnvConfig {
  const EnvConfig._();

  static const String _devUrl = 'https://awimrjguq7.execute-api.ap-southeast-1.amazonaws.com/dev';

  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: _devUrl);
  static const String envPrefix = String.fromEnvironment('ENV_NAME', defaultValue: 'dev');
  static const String version = String.fromEnvironment('VERSION', defaultValue: '0.0.0');
  static const String buildNumber = String.fromEnvironment('BUILD_NUMBER', defaultValue: '0');
}
