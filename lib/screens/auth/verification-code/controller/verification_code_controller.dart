import 'package:e_commerce/common/requset/forget_password_req.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  final AuthService authService = AuthService();

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  var allFieldsFilled = false.obs;

  void handleInputChange(
      TextEditingController controller, FocusNode? nextFocus) {
    updateButtonState();
    if (controller.text.length == 1) {
      nextFocus!.requestFocus();
    }
  }

  String getVerificationCode() {
    return controller1.text +
        controller2.text +
        controller3.text +
        controller4.text;
  }

  @override
  void onClose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.onClose();
  }

  void otpVerify() async {
    final email = Get.arguments['email'];
    if (allFieldsFilled.value && email != null) {
      try {
        CommonGetX.unfocus();
        int otp = int.parse(getVerificationCode());
        final response = await authService.verifyOtp(email: email, otp: otp);
        if (response.error) {
          if (response.errors != null) {
            CommonSnackbar.error(response.errors!['otp']![0]);
          } else {
            CommonSnackbar.error(response.message);
          }
          return;
        }
        CommonSnackbar.success(response.message);
        createPasswordPage(response.data!['email']);
      } catch (e) {
        CommonSnackbar.error(e.toString());
      }
    }
  }

  void clear() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    updateButtonState();
    CommonGetX.unfocus();
    focusNode1.requestFocus();
  }

  void updateButtonState() {
    allFieldsFilled.value = controller1.text.isNotEmpty &&
        controller2.text.isNotEmpty &&
        controller3.text.isNotEmpty &&
        controller4.text.isNotEmpty;
  }

  void resendOtp() async {
    final response = await authService.forgetPassword(ForgetPasswordReq(
      email: Get.arguments['email'],
    ));
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    CommonSnackbar.success(response.message);
    clear();
  }

  void createPasswordPage(String email) {
    Get.toNamed(AppRoutes.password, arguments: {
      'email': email,
    });
  }
}
