import 'package:get/get.dart';

class CommonValidationDto {
  late RxBool isValid = false.obs;
  late RxMap<String, String> errors = <String, String>{}.obs;

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
