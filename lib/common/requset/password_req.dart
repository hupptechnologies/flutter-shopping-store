import 'package:e_commerce/common/requset/forget_password_req.dart';
import 'package:get/get.dart';

class PasswordReq extends ForgetPasswordReq {
  final password = Rx<String?>(null);
  final cPassword = Rx<String?>(null);

  PasswordReq({
    super.email,
    String? password,
    String? cPassword,
  }) {
    this.password.value = password;
    this.cPassword.value = cPassword;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email.value,
      "password": password.value,
    };
  }

  @override
  void updateField({
    String? email,
    String? password,
    String? cPassword,
  }) {
    this.password.value = password ?? this.password.value;
    this.cPassword.value = cPassword ?? this.cPassword.value;
    errors.clear();
    validateForm();
  }

  void validateForm() {
    errors.clear();
    final isPasswordValid =
        validateField(password.value ?? '', fieldType: 'Password') == null;
    final isConPasswordValid =
        validateField(cPassword.value ?? '', fieldType: 'CPassword') == null;
    isValid.value = isPasswordValid && isConPasswordValid;
  }

  @override
  String? validateField(String? value, {String? fieldType}) {
    if (value == null || value.isEmpty) {
      return '$fieldType cannot be empty';
    }
    if (fieldType == 'Password' && value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (fieldType == 'CPassword' && value != password.value) {
      return 'Passwords do not match';
    }
    return null;
  }
}
