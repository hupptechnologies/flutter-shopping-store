import 'package:e_commerce/common/requset/login_req.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService authService = AuthService();
  final LoginReq loginReq = LoginReq();

  void signIn() async {
    CommonGetX.unfocus();
    try {
      final response = await authService.login(loginReq);
      if (!response.error) {
        Get.offAllNamed(AppRoutes.home);
        CommonSnackbar.success(response.message);
        return;
      }

      if (response.error) {
        CommonSnackbar.error("Invalid email or password");
      }
    } catch (e) {
      print(e);
      CommonSnackbar.error(e.toString());
    }
  }

  void signUpPage() {
    Get.toNamed(AppRoutes.signUp);
  }

  void forgetPasswordPage() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
