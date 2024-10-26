import 'dart:convert';
import 'package:gallery_test/core/env.dart';
import 'package:gallery_test/data/models/photo.dart';
import 'package:gallery_test/data/repository/repository.dart';
import 'package:gallery_test/data/service/local_storage/local_storage_service.dart';
import 'package:gallery_test/data/service/network_service/network_service.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.networkService,
    required this.localStorageService,
  });

  final NetworkService networkService;
  final LocalStorageService localStorageService;

  static const _pageKey = 'page';
  static const _perPageKey = 'per_page';
  static const _tokenTypeKey = 'Client-ID';
  static const _authKey = 'Authorization';
  static const String _getPhotosEndPoint = 'photos';

  @override
  Future<void> cachePhotos(List<Photo> photos, int page) =>
      localStorageService.cachePhotos(photos, page);

  @override
  Future<List<Photo>> getCachedPhotosAsPhotos(int page, int perPage) =>
      localStorageService.getCachedPhotosAsPhotos(page, perPage);

  @override
  Future<List<Photo>> fetchPhotos(int page, int perPage) async {
    const String url = '${Env.baseUrl}$_getPhotosEndPoint';
    final headers = {
      _authKey: '$_tokenTypeKey ${Env.apiKey}',
    };

    try {
      final response = await networkService.get<List<dynamic>>(
        url,
        headers: headers,
        queryParameters: {
          _pageKey: page.toString(),
          _perPageKey: perPage.toString(),
        },
      );

      final List<Photo> photos = (response.data as List)
          .map((photoJson) => Photo.fromJson(photoJson))
          .toList();

      return photos;
    } catch (error) {
      print('Error fetching photos from network, loading from cache');
      return await getCachedPhotosAsPhotos(page, perPage);
    }
  }
}
