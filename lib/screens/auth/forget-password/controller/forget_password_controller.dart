import 'package:e_commerce/common/requset/auth/forget_password_req.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordReq forgetPasswordReq = ForgetPasswordReq();
  final AuthService authService = AuthService();

  Future<void> forgetPassword() async {
    try {
      CommonGetX.unfocus();
      final response = await authService.forgetPassword(forgetPasswordReq);
      if (response.error) {
        if (response.errors != null) {
          forgetPasswordReq.setApiErrors(response.errors!);
        } else {
          CommonSnackbar.error(response.message);
        }
        return;
      }
      CommonSnackbar.success(response.message);
      verificationCodePage();
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
  }

  void clearState() {
    CommonGetX.unfocus();
  }

  void verificationCodePage() {
    Get.toNamed(AppRoutes.verificationCode, arguments: {
      'email': forgetPasswordReq.email.value,
    });
  }
}
