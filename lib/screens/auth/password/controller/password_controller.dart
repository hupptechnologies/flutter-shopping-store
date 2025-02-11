import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:e_commerce/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PasswordController extends GetxController {
  final storage = GetStorage();
  late TextEditingController passwordController, confirmPasswordController;
  late RxBool isFormValid = false.obs;

  final AuthService authService = AuthService();

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    passwordController.addListener(validateForm);
    confirmPasswordController.addListener(validateForm);

    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void validateForm() {
    final isPassworValid = validatePassword(passwordController.text) == null;
    final isConPasswordValid =
        validateConfirmPassword(confirmPasswordController.text) == null;
    isFormValid.value = isPassworValid && isConPasswordValid;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null; // No error
  }

  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null; // No error
  }

  void changePassword() async {
    CommonGetX.unfocus();
    // final id = Get.arguments['id'];
    try {
      // if (id.isEmpty) {
      //   return;
      // }
      // final response = await authService.resetPassword(
      //   id: id,
      //   password: passwordController.text,
      //   confirmPassword: confirmPasswordController.text,
      // );

      // if (!response.error) {
      //   CommonGetX.unfocus();
      buildShowBottomSheet(loginPage);
      // } else {
      //   CommonSnackbar.error(response.message);
      // }
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
  }

  void loginPage() {
    storage.write('isLogin', true);
    Get.toNamed(AppRoutes.login);
    clear();
  }
}
