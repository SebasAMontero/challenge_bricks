import 'package:auto_route/auto_route.dart';
import 'package:weather_app_flutter/src/core/routes/auto_route/auto_route.gr.dart';

// import 'package:escuelas_flutter/app/auto_route/router_guards.dart';
// import 'package:escuelas_flutter/utilidades/utilidades.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    // TODO(SAM): Check nesteo rutas.
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
        ),
        AutoRoute(
          page: CustomerFormRoute.page,
          path: '/customer-form',
        ),
        AutoRoute(
          page: CustomerDetailRoute.page,
          path: '/customer-detail',
        ),
      ];
}
