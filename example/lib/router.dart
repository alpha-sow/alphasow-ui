import 'package:auto_route/auto_route.dart';
import 'package:example/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: AvatarRoute.page),
            AutoRoute(page: BannerRoute.page),
            AutoRoute(page: ButtonRoute.page, initial: true),
            AutoRoute(page: DialogRoute.page),
            AutoRoute(page: InputRoute.page),
            AutoRoute(page: LabelRoute.page),
            AutoRoute(page: ListTileRoute.page),
            AutoRoute(page: LoaderRoute.page),
            AutoRoute(page: MenuRoute.page),
          ],
        ),
      ];
}
