import 'package:e_commerce/common/requset/auth/sign_up_req.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late Rx<SignUpReq> signUpReq = SignUpReq().obs;
  final AuthService authService = AuthService();

  Future<void> signUp() async {
    CommonGetX.unfocus();
    try {
      final response = await authService.sigUp(signUpReq.value);
      if (response.error) {
        if (response.errors != null) {
          signUpReq.value.setApiErrors(response.errors!);
        } else {
          CommonSnackbar.error(response.message);
        }
        return;
      }
      loginPage();
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
  }

  void loginPage() {
    Get.toNamed(AppRoutes.login);
  }
}
