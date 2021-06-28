import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class ConfigEnv {
  static String get apiUrl => _get("api_url");

  static String _get(String name) => DotEnv.env[name] ?? '';
}
