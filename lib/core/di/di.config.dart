// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../cubits/app_flow_cubit.dart' as _i49;
import '../cubits/theme_cubit.dart' as _i525;
import '../services/supabase_auth_service.dart' as _i765;
import '../services/supabase_database_service.dart' as _i212;
import '../utils/shared_prefs_helper.dart' as _i964;
import 'modules.dart' as _i738;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final modules = _$Modules();
    await gh.factoryAsync<_i116.GoogleSignIn>(
      () => modules.googleSignIn,
      preResolve: true,
    );
    gh.singleton<_i525.ThemeCubit>(() => _i525.ThemeCubit());
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => modules.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => modules.supabaseClient);
    gh.lazySingleton<_i964.SharedPrefsHelper>(
      () => _i964.SharedPrefsHelper(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i765.SupabaseAuthService>(
      () => _i765.SupabaseAuthService(
        gh<_i454.SupabaseClient>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i212.SupabaseDatabaseService>(
      () => _i212.SupabaseDatabaseService(gh<_i454.SupabaseClient>()),
    );
    gh.singleton<_i49.AppFlowCubit>(
      () => _i49.AppFlowCubit(gh<_i964.SharedPrefsHelper>()),
    );
    return this;
  }
}

class _$Modules extends _i738.Modules {}
