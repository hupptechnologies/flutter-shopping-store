import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';

class ApiService extends GetxService {
  late final dio.Dio _dio;
  late PersistCookieJar _cookieJar;

  late Rx<bool> isLoader = false.obs;
  final storage = GetStorage();

  /// **Constructor (Initializes `_dio`)**
  ApiService() {
    _dio = dio.Dio(dio.BaseOptions(
      baseUrl: UrlConstant.url + UrlConstant.prefix,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }

  /// **Initialize Cookies & Interceptors**
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final cookiePath = '${dir.path}/cookies';
    _cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));

    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<ApiResponse<T>> _request<T>(
    Future<dio.Response> Function() request,
    T Function(dynamic)? fromJsonT,
  ) async {
    isLoader.value = true;
    try {
      final response = await request();
      return ApiResponse.fromJson(response.data, fromJsonT ?? (data) => data);
    } on dio.DioException catch (e) {
      return _handleError<T>(e, fromJsonT ?? (data) => data);
    } finally {
      isLoader.value = false;
    }
  }

  ApiResponse<T> _handleError<T>(
      dio.DioException e, T Function(dynamic) fromJsonT) {
    if (e.response != null) {
      int? statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        clearCookies();
        storage.remove('isLogin');
        Get.offAllNamed(AppRoutes.login);
        return ApiResponse.error("Session expired. Logging out...");
      }
      final dynamic errorData = e.response?.data;
      return ApiResponse.errorData(errorData);
    }
    print('API CALLING ERROR: ${e}');
    return ApiResponse.error("An unexpected error occurred: ${e.message}");
  }

  /// **GET Request**
  Future<ApiResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, T Function(dynamic)? fromJsonT}) {
    return _request(
        () => _dio.get(path, queryParameters: queryParameters), fromJsonT);
  }

  /// **POST Request**
  Future<ApiResponse<T>> post<T>(String path,
      {dynamic data, T Function(dynamic)? fromJsonT}) {
    return _request(() => _dio.post(path, data: data), fromJsonT);
  }

  /// **PATCH Request**
  Future<ApiResponse<T>> patch<T>(String path,
      {dynamic data, T Function(dynamic)? fromJsonT}) {
    return _request(() => _dio.patch(path, data: data), fromJsonT);
  }

  /// **DELETE Request**
  Future<ApiResponse<T>> delete<T>(String path, {T Function(dynamic)? fromJsonT}) {
    return _request(() => _dio.delete(path), fromJsonT);
  }

  /// **Clear Cookies (For Logout)**
  Future<void> clearCookies() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final cookiePath = '${dir.path}/cookies';

      if (Directory(cookiePath).existsSync()) {
        await _cookieJar.deleteAll();
      } else {
        if (kDebugMode) {
          print("Cookie directory does not exist, skipping deletion.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error clearing cookies: $e");
      }
    }
  }
}
