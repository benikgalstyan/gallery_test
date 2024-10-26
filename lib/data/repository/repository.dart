import 'package:gallery_test/data/models/photo.dart';

abstract interface class Repository {
  Future<List<Photo>> fetchPhotos(int page, int perPage);

  Future<void> cachePhotos(List<Photo> photos, int page);

  Future<List<Photo>> getCachedPhotosAsPhotos(int page, int perPage);
}
