import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/types/respose_dto.dart';
import 'package:e_commerce/service/api_service.dart';

class AuthService extends ApiService {
  AuthService() : super(UrlConstant.auth);

  Future<ResponseDto> login(
      {required String email, required String password}) async {
    final loginData = {
      'email': email,
      'password': password,
    };
    return post(UrlConstant.login, data: loginData);
  }

  Future<ResponseDto<String>> forgetPassword({required String userName}) async {
    final forgetPasswordReq = {
      'usernameAndEmail': userName,
    };
    return post(UrlConstant.forgetPassword, data: forgetPasswordReq);
  }

  Future<ResponseDto<String>> otpVerifyed(
      {required String otp, required String id}) async {
    final otpVerifyedReq = {
      'id': id,
      'otp': int.parse(otp),
    };
    return post(UrlConstant.otp, data: otpVerifyedReq);
  }

  Future<ResponseDto<bool>> resetPassword(
      {required String id,
      required String password,
      required String confirmPassword}) async {
    final resetPaswprdReq = {
      'token': id,
      'password': password,
      'confirmPassword': confirmPassword
    };
    return post(UrlConstant.resetPassword, data: resetPaswprdReq);
  }

  Future<ResponseDto> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    final signUpReq = {'name': name, 'email': email, 'password': password};
    return post(UrlConstant.signUp, data: signUpReq);
  }
}
