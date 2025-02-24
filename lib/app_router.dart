import 'package:auto_route/auto_route.dart';
import 'package:realsocial/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        ///
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(page: AppRoute.page),
      ];
}
