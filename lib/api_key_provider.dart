import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiKeyProvider = Provider<ApiKeyProvider>(
  (ref) => ApiKeyProvider(),
);

class ApiKeyProvider {
  String idWallAuthKey() {
    return dotenv.env['IDWALL_AUTH_KEY'] ?? '';
  }

  String idWallPublicKeyOne() {
    return dotenv.env['IDWALL_AUTH_KEY'] ?? '';
  }

  String idWallPublicKeyTwo() {
    return dotenv.env['IDWALL_AUTH_KEY'] ?? '';
  }
}
