import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/main_shell/presentation/main_shell_view.dart';
import '../../features/splash/splash_screen.dart';
import '../cubits/app_flow_cubit.dart';
import '../di/di.dart';
import 'app_routes.dart';
import 'go_router_listenable_builder.dart';
import 'page_transition_builder.dart';

class AppRouter {
  /// Single GoRouter instance, created once after [getIt.allReady()].
  static final GoRouter router = _createRouter();

  static GoRouter _createRouter() {
    final appFlowCubit = getIt<AppFlowCubit>();

    return GoRouter(
      // Re-evaluates redirect every time AppFlowCubit emits a new state.
      refreshListenable: GoRouterListenableBuilder(appFlowCubit.stream),
      redirect: (context, state) => appFlowCubit.resolveRedirect(state.matchedLocation),
      routes: [
        _route(
          AppRoutes.splash,
          builder: (context, state) => SplashScreen(
            onFinished: () => context.go(appFlowCubit.targetRoute),
          ),
        ),
        _route(
          AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        _route(
          AppRoutes.signup,
          builder: (context, state) => const SignupScreen(),
        ),
        _route(
          AppRoutes.mainShell,
          builder: (context, state) => const MainShellView(),
        ),
      ],
    );
  }

  static GoRoute _route(
    String path, {
    required Widget Function(BuildContext context, GoRouterState state) builder,
    String? Function(BuildContext context, GoRouterState state)? redirect,
    List<RouteBase> routes = const [],
    PageTransitionType transition = PageTransitionType.platformAdaptive,
  }) {
    return GoRoute(
      path: path,
      redirect: redirect,
      routes: routes,
      pageBuilder: (context, state) {
        final child = builder(context, state);
        return PageTransitionBuilder.build(
          child: child,
          key: state.pageKey,
          transition: transition,
        );
      },
    );
  }
}
