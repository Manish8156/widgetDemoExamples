enum FlavorEnvironment {
  development,
  staging,
  production,
}

/// Singleton class for flavors configuration
class FlavorsConfig {
  static FlavorsConfig? _instance;
  final FlavorEnvironment flavor;
  final String baseUrl;

  factory FlavorsConfig({required FlavorEnvironment flavor, required String baseUrl}) =>
      _instance ??= FlavorsConfig._(flavor, baseUrl);

  FlavorsConfig._(this.flavor, this.baseUrl);

  static FlavorsConfig? get instance => _instance;
}
