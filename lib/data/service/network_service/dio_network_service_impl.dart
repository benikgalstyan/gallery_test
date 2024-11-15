import 'package:dio/dio.dart';
import 'package:gallery_test/core/templates/typedefs.dart';
import 'package:gallery_test/data/service/network_service/network_service.dart';

class DioNetworkServiceImpl implements NetworkService {
  DioNetworkServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<Response<T>> delete<T>(
    String url, {
    required HeaderMap headers,
  }) {
    try {
      return _dio.delete<T>(
        url,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    required HeaderMap headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<T>(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> post<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  }) {
    try {
      return _dio.post<T>(
        url,
        data: body,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response<T>> put<T>(
    String url, {
    required HeaderMap headers,
    required JsonMap body,
  }) {
    try {
      return _dio.put<T>(
        url,
        data: body,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }
}
