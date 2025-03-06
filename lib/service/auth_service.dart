import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/requset/auth/forget_password_req.dart';
import 'package:e_commerce/common/requset/auth/password_req.dart';
import 'package:e_commerce/common/requset/auth/sign_up_req.dart';
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

  Future<ApiResponse<UserDto>> sigUp(SignUpReq data) async {
    return post(
      UrlConstant.signup,
      (json) => UserDto.fromJson(json),
      data: data.toJson(),
    );
  }

  Future<ApiResponse<String>> forgetPassword(ForgetPasswordReq data) async {
    return post(
      UrlConstant.forgetPassword,
      (json) => json,
      data: data.toJson(),
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required int otp,
    required String email,
  }) async {
    return post(UrlConstant.verifyOtp, (json) => json,
        data: {"email": email, "otp": otp});
  }

  Future<ApiResponse> resetPassword(PasswordReq data) async {
    return post(UrlConstant.resetPassword, (json) => json, data: data.toJson());
  }
}
