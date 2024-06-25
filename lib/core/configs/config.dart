class Config {
  const Config._();

  /// flutter build apk --debug --dart-define=BASE_URL=www.some_url.com
  /// OR
  /// flutter run --dart-define=BASE_URL=www.some_url.com
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://7ayvpkcn48.execute-api.ap-southeast-1.amazonaws.com/dev',
  );
}
