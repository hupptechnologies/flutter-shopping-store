import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/requset/forget_password_req.dart';
import 'package:e_commerce/common/requset/login_req.dart';
import 'package:e_commerce/common/requset/password_req.dart';
import 'package:e_commerce/common/requset/sign_up_req.dart';
import 'package:e_commerce/dto/user_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class AuthService extends BaseService {
  Future<ApiResponse<UserDto>> login(LoginReq data) async {
    final response = await api.post(
      url: UrlConstant.login,
      fromJsonT: (data) => UserDto.fromJson(data),
      data: data.toJson(),
    );
    if (!response.error) {
      api.storage.write('isLogin', true);
    }
    return response;
  }

  Future<ApiResponse> logout() async {
    try {
      final response = await api.post(url: UrlConstant.logout);
      return response;
    } finally {
      api.storage.remove('isLogin');
      api.clearCookies();
    }
  }

  Future<ApiResponse<UserDto>> sigUp(SignUpReq data) async {
    return api.post(
      url: UrlConstant.signup,
      fromJsonT: (json) => UserDto.fromJson(json),
      data: data.toJson(),
    );
  }

  Future<ApiResponse<String>> forgetPassword(ForgetPasswordReq data) async {
    return api.post(
      url: UrlConstant.forgetPassword,
      data: data.toJson(),
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required int otp,
    required String email,
  }) async {
    return api.post(
      url: UrlConstant.verifyOtp,
      data: {"email": email, "otp": otp},
    );
  }

  Future<ApiResponse> resetPassword(PasswordReq data) async {
    return api.post(url: UrlConstant.resetPassword, data: data.toJson());
  }
}
