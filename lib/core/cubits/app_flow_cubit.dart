import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../routing/app_routes.dart';
import '../utils/app_keys.dart';
import '../utils/shared_prefs_helper.dart';
import 'app_flow_state.dart';

@Singleton()
class AppFlowCubit extends Cubit<AppFlowState> {
  AppFlowCubit(this._prefs) : super(_resolve(_prefs));

  final SharedPrefsHelper _prefs;

  static const _onboardingKey = AppKeys.isOnboardingDone;

  /// Derives the correct initial state from persisted preferences.
  /// Since onboarding is not implemented yet, it starts directly at [login]
  /// (or [home] if onboarding/auth was already completed).
  static AppFlowState _resolve(SharedPrefsHelper prefs) {
    final done = prefs.getBool(_onboardingKey);
    return done ? AppFlowState.home : AppFlowState.login;
  }

  /// Resolves the target route for splash or initial entry point based on [state].
  String get targetRoute {
    switch (state) {
      case AppFlowState.login:
        return AppRoutes.login;
      case AppFlowState.home:
        return AppRoutes.home;
    }
  }

  /// Resolves redirection logic based on current [AppFlowState] and [currentPath].
  ///
  /// Covers all flow scenarios:
  /// - Splash screen: returns `null` so splash animations/initialization can finish.
  /// - [AppFlowState.login]: guards all other routes and redirects to login (or allows signup).
  /// - [AppFlowState.home]: guards auth routes and redirects to home.
  String? resolveRedirect(String currentPath) {
    // Keep user on the splash screen while it performs animation/initialization.
    if (currentPath == AppRoutes.splash) {
      return null;
    }

    switch (state) {
      case AppFlowState.login:
        // Guard: unauthenticated → stay on login or signup.
        if (currentPath != AppRoutes.login && currentPath != AppRoutes.signup) {
          return AppRoutes.login;
        }
        return null;

      case AppFlowState.home:
        // Guard: authenticated → never show login or signup again.
        if (currentPath == AppRoutes.login || currentPath == AppRoutes.signup) {
          return AppRoutes.home;
        }
        return null;
    }
  }

  /// Marks login/onboarding as complete, persists the flag, and moves to [home].
  /// GoRouter's refreshListenable will re-evaluate the redirect automatically.
  void completeLogin() {
    _prefs.setBool(key: _onboardingKey, value: true);
    emit(AppFlowState.home);
  }

  /// Logs out the user, resets the state, and moves to [login].
  void logout() {
    _prefs.setBool(key: _onboardingKey, value: false);
    emit(AppFlowState.login);
  }
}

