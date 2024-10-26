// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    PhotoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhotoDetailScreen(
          key: args.key,
          photo: args.photo,
        ),
      );
    },
  };
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhotoDetailScreen]
class PhotoDetailRoute extends PageRouteInfo<PhotoDetailRouteArgs> {
  PhotoDetailRoute({
    Key? key,
    required Photo photo,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoDetailRoute.name,
          args: PhotoDetailRouteArgs(
            key: key,
            photo: photo,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoDetailRoute';

  static const PageInfo<PhotoDetailRouteArgs> page =
      PageInfo<PhotoDetailRouteArgs>(name);
}

class PhotoDetailRouteArgs {
  const PhotoDetailRouteArgs({
    this.key,
    required this.photo,
  });

  final Key? key;

  final Photo photo;

  @override
  String toString() {
    return 'PhotoDetailRouteArgs{key: $key, photo: $photo}';
  }
}
