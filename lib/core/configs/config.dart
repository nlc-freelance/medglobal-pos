class EnvConfig {
  const EnvConfig._();

  static const String _devUrl = 'https://awimrjguq7.execute-api.ap-southeast-1.amazonaws.com/dev';

  static const String baseUrl = String.fromEnvironment('BASE_URL', defaultValue: _devUrl);
  static const String envPrefix = String.fromEnvironment('ENV_NAME', defaultValue: 'dev');
}
