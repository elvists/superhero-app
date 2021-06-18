abstract class AppEnv {
  static const String apiBaseUrl = String.fromEnvironment('api_base_url',
      defaultValue: "https://akabab.github.io/superhero-api/api/");
}
