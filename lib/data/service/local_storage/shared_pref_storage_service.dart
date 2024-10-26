import 'dart:convert';

import 'package:gallery_test/data/models/photo.dart';
import 'package:gallery_test/data/service/local_storage/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorageService implements LocalStorageService {
  @override
  Future<void> cachePhotos(List<Photo> photos, int page) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> photoJsonList = photos.map((photo) {
      return jsonEncode({
        'thumbnailUrl': photo.thumbnailUrl,
        'author': photo.author,
        'url': photo.url,
        'description': photo.description,
      });
    }).toList();

    await prefs.setStringList('cachedPhotos_page_$page', photoJsonList);
  }

  @override
  Future<List<Photo>> getCachedPhotosAsPhotos(int page, int perPage) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedPhotoJsonList =
        prefs.getStringList('cachedPhotos_page_$page') ?? [];

    return cachedPhotoJsonList.map((photoJson) {
      final data = jsonDecode(photoJson);
      return Photo(
        thumbnailUrl: data['thumbnailUrl'],
        author: data['author'],
        url: data['url'],
        description: data['description'],
      );
    }).toList();
  }
}
