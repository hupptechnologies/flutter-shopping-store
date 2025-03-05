import 'package:get/get.dart';

class SignUpReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  late RxBool isValid = false.obs;
  late RxMap<String, String> errors = <String, String>{}.obs;

  SignUpReq({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  void updateField({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    if (firstName != null) this.firstName = firstName;
    if (lastName != null) this.lastName = lastName;
    if (email != null) this.email = email;
    if (password != null) this.password = password;
    if (confirmPassword != null) this.confirmPassword = confirmPassword;
    validateForm();
  }

  void validateForm() {
    errors.clear();
    errors.refresh();
    final isFNameValid =
        validateField(firstName, fieldType: 'First Name') == null;
    final isLNameValid =
        validateField(lastName, fieldType: 'Last Name') == null;
    final isEmailValid = validateField(email, fieldType: 'Email') == null;
    final isPasswordValid =
        validateField(password, fieldType: 'Password') == null;
    final isConPasswordValid =
        validateField(confirmPassword, fieldType: 'Confirm Password') == null;

    isValid.value = isFNameValid &&
        isLNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConPasswordValid;
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
    if (fieldType == 'Confirm Password' && value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  void setApiErrors(Map<String, dynamic> apiErrors) {
    apiErrors.forEach((key, value) {
      if (value is List) {
        errors[key] = value.first;
      } else {
        errors[key] = value;
      }
    });
    errors.refresh();
  }
}
