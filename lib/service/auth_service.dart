import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/api_service.dart';

class AuthService extends ApiService {
  AuthService() : super(UrlConstant.auth);

  Future<ApiResponse<UserDto>> login({
    required String email,
    required String password,
  }) async {
    return post(
      UrlConstant.login,
      (data) => UserDto.fromJson(data),
      data: {"email": email, "password": password},
    );
  }

  Future<ApiResponse<Null>> logout() async {
    return post(UrlConstant.logout, (data) => data);
  }
}
