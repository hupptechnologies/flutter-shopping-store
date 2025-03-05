import 'package:e_commerce/common/requset/common_validation_dto.dart';
import 'package:get/get.dart';

class ForgetPasswordReq extends CommonValidationDto {
  var email = Rx<String?>(null);

  ForgetPasswordReq({String? email}) {
    this.email.value = email;
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email.value,
    };
  }

  void updateField({String? email}) {
    this.email.value = email ?? this.email.value;
    errors.clear();
    isValid.value = validateField(this.email.value ?? '') == null;
  }

  String? validateField(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
}
