import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_test/data/repository/repository.dart';
import 'package:gallery_test/presentation/pages/main_screen/bloc/main_bloc.dart';
import 'package:gallery_test/presentation/pages/main_screen/main_layout.dart';
import 'package:gallery_test/service_locator.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const nameRoute = '/MainScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(getIt<Repository>()),
      child: const MainLayout(),
    );
  }
}
