import 'package:auto_route/auto_route.dart';
import 'package:example/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(path: 'avatar', page: AvatarRoute.page),
            AutoRoute(path: 'banner', page: BannerRoute.page),
            AutoRoute(path: 'button', page: ButtonRoute.page, initial: true),
            AutoRoute(path: 'dialog', page: DialogRoute.page),
            AutoRoute(path: 'input', page: InputRoute.page),
            AutoRoute(path: 'label', page: LabelRoute.page),
            AutoRoute(path: 'list-tile', page: ListTileRoute.page),
            AutoRoute(path: 'loader', page: LoaderRoute.page),
            AutoRoute(path: 'menu', page: MenuRoute.page),
            AutoRoute(path: 'card', page: CardRoute.page),
          ],
        ),
      ];
}
