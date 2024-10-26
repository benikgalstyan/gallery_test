part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class FetchPhotosEvent extends MainEvent {
  FetchPhotosEvent({required this.page, required this.perPage});

  final int page;
  final int perPage;
}
