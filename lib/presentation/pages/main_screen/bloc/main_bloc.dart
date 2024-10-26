import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_test/data/models/photo.dart';
import 'package:gallery_test/data/repository/repository.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this.repository) : super(MainInitialState()) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

  final Repository repository;

  Future<void> _onFetchPhotos(
    FetchPhotosEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(MainLoadingState());

    try {
      final List<Photo> photos =
          await repository.fetchPhotos(event.page, event.perPage);

      await repository.cachePhotos(photos, event.page);

      emit(MainLoadedState(photos: photos));
    } catch (e) {
      final cachedPhotos =
          await repository.getCachedPhotosAsPhotos(event.page, event.perPage);
      if (cachedPhotos.isNotEmpty) {
        emit(MainLoadedState(photos: cachedPhotos));
      } else {
        emit(MainErrorState('Error: ${e.toString()}'));
      }
    }
  }
}
