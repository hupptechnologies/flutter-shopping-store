import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController emailController;

  late RxBool isFormValid = false.obs;
  final AuthService authService = AuthService();

  @override
  void onInit() {
    emailController = TextEditingController();

    emailController.addListener(validateForm);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }

  void validateForm() {
    isFormValid.value = validation(emailController.text) == null;
  }

  String? validation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  void forgetPassword() async {
    try {
      CommonGetX.unfocus();
      final response =
          await authService.forgetPassword(userName: emailController.text);
      if (!response.error) {
        clearState();
        CommonSnackbar.success(response.message);
        verificationCodePage(response.data ?? '');
      } else {
        CommonSnackbar.error(response.message);
      }
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
  }

  void clearState() {
    emailController.clear();
    CommonGetX.unfocus();
  }

  void verificationCodePage(String id) {
    Get.toNamed(AppRoutes.verificationCode, arguments: {
      'id': id,
    });
  }
}
