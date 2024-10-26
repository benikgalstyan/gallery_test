import 'package:gallery_test/data/models/photo.dart';

abstract class LocalStorageService {
  Future<void> cachePhotos(List<Photo> photos, int page);

  Future<List<Photo>> getCachedPhotosAsPhotos(int page, int perPage);
}
