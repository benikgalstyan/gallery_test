import 'package:auto_route/auto_route.dart';
import 'package:gallery_test/presentation/pages/main_screen/main_screen.dart';
import 'package:gallery_test/presentation/pages/photo_detail_screen/photo_detail_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MainRoute.page, path: MainScreen.nameRoute, initial: true),
        AutoRoute(
            page: PhotoDetailRoute.page, path: PhotoDetailScreen.nameRoute),
      ];
}
