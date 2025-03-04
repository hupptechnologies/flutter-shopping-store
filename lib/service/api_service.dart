import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';

class ApiService {
  final Dio _dio;
  final CookieJar _cookieJar;

  ApiService(String baseUrl)
      : _dio = Dio(
          BaseOptions(
            baseUrl: UrlConstant.url + UrlConstant.prefix + baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ),
        _cookieJar = CookieJar() {
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<ApiResponse<T>> _request<T>(
    Future<Response> Function() request,
    T Function(dynamic) fromJsonT,
  ) async {
    try {
      final response = await request();
      return ApiResponse.fromJson(response.data, fromJsonT);
    } on DioException catch (e) {
      return _handleError<T>(e, fromJsonT);
    }
  }

  ApiResponse<T> _handleError<T>(
      DioException e, T Function(dynamic) fromJsonT) {
    if (e.response != null) {
      int? statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        return ApiResponse.error("Session expired. Logging out...");
      }
      return ApiResponse.fromJson(e.response?.data, fromJsonT);
    }
    return ApiResponse.error("An unexpected error occurred: ${e.message}");
  }

  /// **GET Request**
  Future<ApiResponse<T>> get<T>(String path, T Function(dynamic) fromJsonT,
      {Map<String, dynamic>? queryParameters}) {
    return _request(
        () => _dio.get(path, queryParameters: queryParameters), fromJsonT);
  }

  /// **POST Request**
  Future<ApiResponse<T>> post<T>(String path, T Function(dynamic) fromJsonT,
      {dynamic data}) {
    return _request(() => _dio.post(path, data: data), fromJsonT);
  }

  /// **PATCH Request**
  Future<ApiResponse<T>> patch<T>(String path, T Function(dynamic) fromJsonT,
      {dynamic data}) {
    return _request(() => _dio.patch(path, data: data), fromJsonT);
  }

  /// **DELETE Request**
  Future<ApiResponse<T>> delete<T>(String path, T Function(dynamic) fromJsonT) {
    return _request(() => _dio.delete(path), fromJsonT);
  }
}
