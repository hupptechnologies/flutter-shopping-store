import 'package:get/get.dart';

class LanguageController extends GetxController {
  final List<String> languages = [
    'English',
    'हिन्दी',
    'ગુજરાતી',
  ];

  late Rx<String> selectedLan = 'English'.obs;

  void changeLanguage(String? value) {
    if (value != null && value.isNotEmpty) {
      selectedLan.value = value;
    }
  }
}
