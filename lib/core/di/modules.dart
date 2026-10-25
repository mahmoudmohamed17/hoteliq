import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/app_config.dart';

@module
abstract class Modules {
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @preResolve
  @singleton
  Future<GoogleSignIn> get googleSignIn async {
    final instance = GoogleSignIn.instance;
    await instance.initialize(serverClientId: AppConfig.instance.webClientId);
    return instance;
  }
}
