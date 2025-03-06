import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/requset/forget_password_req.dart';
import 'package:e_commerce/common/requset/login_req.dart';
import 'package:e_commerce/common/requset/password_req.dart';
import 'package:e_commerce/common/requset/sign_up_req.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/api_service.dart';
import 'package:get/get.dart';

class AuthService {
  final ApiService apiService = Get.find<ApiService>();

  Future<ApiResponse<UserDto>> login(LoginReq data) async {
    final response = await apiService.post(
      UrlConstant.login,
      (data) => UserDto.fromJson(data),
      data: data.toJson(),
    );
    if (!response.error) {
      apiService.storage.write('isLogin', true);
    }
    return response;
  }

  Future<ApiResponse> logout() async {
    try {
      final response = await apiService.post(UrlConstant.logout, (data) => data);
      return response;
    } finally {
      apiService.storage.remove('isLogin');
      apiService.clearCookies();
    }
  }

  Future<ApiResponse<UserDto>> sigUp(SignUpReq data) async {
    return apiService.post(
      UrlConstant.signup,
      (json) => UserDto.fromJson(json),
      data: data.toJson(),
    );
  }

  Future<ApiResponse<String>> forgetPassword(ForgetPasswordReq data) async {
    return apiService.post(
      UrlConstant.forgetPassword,
      (json) => json,
      data: data.toJson(),
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required int otp,
    required String email,
  }) async {
    return apiService.post(UrlConstant.verifyOtp, (json) => json,
        data: {"email": email, "otp": otp});
  }

  Future<ApiResponse> resetPassword(PasswordReq data) async {
    return apiService.post(UrlConstant.resetPassword, (json) => json, data: data.toJson());
  }
}
