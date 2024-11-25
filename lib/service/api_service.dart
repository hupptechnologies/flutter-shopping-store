import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/types/respose_dto.dart';

class ApiService {
  final Dio _dio;
  final CookieJar _cookieJar;

  ApiService(String baseUrl)
      : _dio = Dio(BaseOptions(
          baseUrl: UrlConstant.baseURL + baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )),
        _cookieJar = CookieJar() {
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  // Helper method to handle response and errors
  Future<ResponseDto<T>> _handleRequest<T>(Future<Response> request) async {
    try {
      final response = await request;
      return ResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data is Map<String, dynamic>) {
        // If the server returned an error response, try to parse it
        return ResponseDto.fromJson(e.response!.data);
      } else {
        // If there's no response data, return a generic error message
        return ResponseDto.error("An unexpected error occurred.");
      }
    } catch (e) {
      // Handle any other types of errors
      return ResponseDto.error("An unexpected error occurred: $e");
    }
  }

  // GET request
  Future<ResponseDto> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return _handleRequest(_dio.get(endpoint, queryParameters: queryParameters));
  }

  // POST request
  Future<ResponseDto<T>> post<T>(String endpoint,
      {Map<String, dynamic>? data}) async {
    return _handleRequest(_dio.post(endpoint, data: data));
  }

  // PUT request
  Future<ResponseDto> put(String endpoint, {Map<String, dynamic>? data}) async {
    return _handleRequest(_dio.put(endpoint, data: data));
  }

  // DELETE request
  Future<ResponseDto> delete(String endpoint,
      {Map<String, dynamic>? data}) async {
    return _handleRequest(_dio.delete(endpoint, data: data));
  }

  // Clear cookies (if needed)
  Future<void> clearCookies() async {
    await _cookieJar.deleteAll();
  }
}
