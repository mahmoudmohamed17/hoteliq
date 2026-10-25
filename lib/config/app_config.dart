import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  const AppConfig._({
    required this.supabaseUrl,
    required this.publishableKey,
    required this.webClientId,
  });

  final String supabaseUrl;
  final String publishableKey;
  final String webClientId;

  static late final AppConfig instance;

  static Future<void> load() async {
    await dotenv.load();
    instance = AppConfig._(
      supabaseUrl: dotenv.get('SUPABASE_URL'),
      publishableKey: dotenv.get('PUBLISHABLE_KEY'),
      webClientId: dotenv.get('WEB_CLIENT_ID'),
    );
  }
}
