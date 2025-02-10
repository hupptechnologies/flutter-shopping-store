import 'package:e_commerce/screens/appSetting/screens/language/controller/language_controller.dart';
import 'package:get/get.dart';

class LanguageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
