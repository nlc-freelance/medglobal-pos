class EnvConfig {
  const EnvConfig._();

  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String envPrefix = String.fromEnvironment('ENV_NAME');
}
