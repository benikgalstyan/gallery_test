import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_test/core/context_extensions.dart';
import 'package:gallery_test/core/router/router.dart';
import 'package:gallery_test/presentation/pages/main_screen/bloc/main_bloc.dart';
import 'package:gallery_test/presentation/widgets/photo_grid.dart';
import 'package:gallery_test/presentation/widgets/pagination_controls.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final perPage = 20;
  int currentPage = 1;
  final totalPages = 5;

  @override
  void initState() {
    super.initState();
    _fetchPhotos();
  }

  void _fetchPhotos() => context
      .read<MainBloc>()
      .add(FetchPhotosEvent(page: currentPage, perPage: perPage));

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Center(child: Text(context.s.gallery))),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) => switch (state) {
                  MainInitialState() => Center(child: Text(context.s.loading)),
                  MainLoadingState() =>
                    const Center(child: CircularProgressIndicator()),
                  MainLoadedState() => PhotoGrid(
                      photos: state.photos,
                      onPhotoTap: (photo) =>
                          context.r.push(PhotoDetailRoute(photo: photo)),
                    ),
                  MainErrorState() =>
                    Center(child: Text('Error ${state.exception.toString()}')),
                },
              ),
            ),
            PaginationControls(
              totalPages: totalPages,
              currentPage: currentPage,
              onPageSelected: (pageNumber) {
                setState(() => currentPage = pageNumber);
                _fetchPhotos();
              },
            ),
          ],
        ),
      );
}
