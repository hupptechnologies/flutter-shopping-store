import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  final AuthService authService = AuthService();
  late RxBool isFormValid = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    clearState();
  }

  @override
  void onClose() {
    super.onClose();
    clearState();
    emailController.dispose();
    passwordController.dispose();
  }

  void validateForm() {
    final isEmailValid = validateEmail(emailController.text) == null;
    final isPasswordValid = validatePassword(passwordController.text) == null;
    isFormValid.value = isEmailValid && isPasswordValid;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  void clearState() {
    emailController.clear();
    passwordController.clear();
    CommonGetX.unfocus();
  }

  void signIn() async {
    // if (loginFormKey.currentState!.validate()) {
    try {
      CommonGetX.unfocus();
      final login = await authService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      // ignore: avoid_print
      if (!login.error) {
        CommonSnackbar.success(login.message);
        homePage();
      } else {
        CommonSnackbar.error(login.message);
      }
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
    // }
  }

  void signUpPage() {
    Get.toNamed(AppRoutes.signUp);
    clearState();
  }

  void forgetPasswordPage() {
    Get.toNamed(AppRoutes.forgetPassword);
    clearState();
  }

  void homePage() {
    Get.toNamed(AppRoutes.home);
    clearState();
  }
}
