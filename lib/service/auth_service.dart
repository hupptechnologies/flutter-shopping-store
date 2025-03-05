import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/api_service.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends ApiService {
  AuthService() : super(UrlConstant.auth);
  final storage = GetStorage();

  Future<ApiResponse<UserDto>> login({
    required String email,
    required String password,
  }) async {
    final response = await post(
      UrlConstant.login,
      (data) => UserDto.fromJson(data),
      data: {"email": email, "password": password},
    );
    if (!response.error) {
      storage.write('isLogin', true);
    }
    return response;
  }

  Future<ApiResponse> logout() async {
    try {
      final response = await post(UrlConstant.logout, (data) => data);
      return response;
    } finally {
      storage.remove('isLogin');
      clearCookies();
    }
  }
}
