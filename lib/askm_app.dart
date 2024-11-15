import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gallery_test/core/logger/composite_logger_holder.dart';
import 'package:gallery_test/core/router/app_router_holder.dart';
import 'package:gallery_test/core/router/router.dart';
import 'package:gallery_test/generated/l10n.dart';
import 'package:gallery_test/service_locator.dart';

class AskmApp extends StatefulWidget {
  const AskmApp({super.key});

  @override
  State<AskmApp> createState() => _AskmAppState();
}

class _AskmAppState extends State<AskmApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ru'),
      // TODO(Benik): delete later ru localization
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.dark(),
      routerConfig: _router.config(),
      builder: (context, router) {
        return AppRouterHolder(
          router: _router,
          child: CompositeLoggerHolder(
            compositeLogger: getLogger,
            child: router!,
          ),
        );
      },
    );
  }
}
