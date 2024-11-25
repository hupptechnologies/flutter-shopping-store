import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController nameController,
      emailController,
      passwordController,
      confirmPasswordController;

  final AuthService authService = AuthService();

  late RxBool isFormValid = false.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    nameController.addListener(validateForm);
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
    confirmPasswordController.addListener(validateForm);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void validateForm() {
    final isNameValid =
        validateField(nameController.text, fieldType: 'Name') == null;
    final isEmailValid =
        validateField(emailController.text, fieldType: 'Email') == null;
    final isPasswordValid =
        validateField(passwordController.text, fieldType: 'Password') == null;
    final isConPasswordValid = validateField(confirmPasswordController.text,
            fieldType: 'Confirm Password') ==
        null;

    isFormValid.value =
        isNameValid && isEmailValid && isPasswordValid && isConPasswordValid;
  }

  String? validateField(String? value, {String? fieldType}) {
    if (value == null || value.isEmpty) {
      return '$fieldType cannot be empty';
    }
    if (fieldType == 'Email' && !GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    if (fieldType == 'Password' && value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (fieldType == 'Confirm Password' && value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void signUp() async {
    CommonGetX.unfocus();
    try {
      final response = await authService.signUp(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (!response.error) {
        CommonSnackbar.success(response.message);
        loginPage();
      } else {
        CommonSnackbar.error(response.message);
      }
    } catch (e) {
      CommonSnackbar.error(e.toString());
    }
  }

  void loginPage() {
    Get.toNamed(AppRoutes.login);
    clearState();
  }

  void clearState() {
    CommonGetX.unfocus();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
