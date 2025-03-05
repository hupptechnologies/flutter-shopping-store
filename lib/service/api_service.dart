import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  final dio.Dio _dio;
  late final CookieJar _cookieJar;
  late Rx<bool> isLoader = false.obs;

  ApiService(String baseUrl)
      : _dio = dio.Dio(
          dio.BaseOptions(
            baseUrl: UrlConstant.url + UrlConstant.prefix + baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    _initializeCookies();
  }

  Future<void> _initializeCookies() async {
    final dir = await getApplicationDocumentsDirectory();
    _cookieJar =
        PersistCookieJar(storage: FileStorage("${dir.path}/.cookies/"));
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<ApiResponse<T>> _request<T>(
    Future<dio.Response> Function() request,
    T Function(dynamic) fromJsonT,
  ) async {
    isLoader.value = true;
    try {
      final response = await request();
      return ApiResponse.fromJson(response.data, fromJsonT);
    } on dio.DioException catch (e) {
      return _handleError<T>(e, fromJsonT);
    } finally {
      isLoader.value = false;
    }
  }

  ApiResponse<T> _handleError<T>(
      dio.DioException e, T Function(dynamic) fromJsonT) {
    if (e.response != null) {
      int? statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        return ApiResponse.error("Session expired. Logging out...");
      }
      final dynamic errorData = e.response?.data;
      return ApiResponse.errorData(errorData);
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

  /// **Clear Cookies (For Logout)**
  Future<void> clearCookies() async {
    await _cookieJar.deleteAll();
  }
}
