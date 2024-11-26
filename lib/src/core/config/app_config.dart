import 'environment.dart';

class AppConfig {
  late Environment environment;
  late Map<String, dynamic> _config;

  String get baseUrl => _config[_Config.baseURL];

  AppConfig(this.environment) {
    switch (environment) {
      case Environment.dev:
        _config = _Config.devConstants;
        break;
      case Environment.staging:
        _config = _Config.stagingConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }
}

class _Config {
  static const baseURL = 'BASE_URL';

  static Map<String, dynamic> devConstants = {
    baseURL: 'https://api.jikan.moe/v4',
  };

  static Map<String, dynamic> stagingConstants = {
    baseURL: 'https://api.jikan.moe/v4',
  };

  static Map<String, dynamic> prodConstants = {
    baseURL: 'https://api.jikan.moe/v4',
  };
}
