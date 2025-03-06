import 'package:e_commerce/common/requset/password_req.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:e_commerce/widgets/bottom_sheet.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final AuthService authService = AuthService();
  final PasswordReq passwordReq = PasswordReq();

  @override
  void onInit() {
    final email = Get.arguments['email'];
    if (email != null && email.isNotEmpty) {
      passwordReq.email.value = email;
    }
    super.onInit();
  }

  void changePassword() async {
    CommonGetX.unfocus();
    try {
      final response = await authService.resetPassword(passwordReq);
      if (response.error) {
        CommonSnackbar.error(response.message);
        return;
      }
      buildShowBottomSheet(loginPage);
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
  }

  void loginPage() {
    Get.toNamed(AppRoutes.login);
  }
}
