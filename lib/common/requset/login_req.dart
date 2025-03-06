import 'package:e_commerce/common/requset/common_validation_dto.dart';
import 'package:get/get.dart';

class LoginReq extends CommonValidationDto {
  final Rx<String?> email = Rx(null);
  final Rx<String?> password = Rx(null);

  LoginReq({String? email, String? password}) {
    this.email.value = email;
    this.password.value = password;
  }

  Map<String, String> toJson() {
    return {
      'email': email.value!,
      'password': password.value!,
    };
  }

  void updateField({String? email, String? password}) {
    if (email != null) this.email.value = email;
    if (password != null) this.password.value = password;
    errors.clear();
    validateForm();
  }

  void validateForm() {
    errors.clear();
    final isEmailValid =
        validateField(email.value ?? '', fieldType: 'Email') == null;
    final isPasswordValid =
        validateField(password.value ?? '', fieldType: 'Password') == null;
    isValid.value = isEmailValid && isPasswordValid;
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
    return null;
  }
}
