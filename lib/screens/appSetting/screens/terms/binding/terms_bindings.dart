import 'package:e_commerce/screens/appSetting/screens/terms/controller/terms_controller.dart';
import 'package:get/get.dart';

class TermsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsController>(() => TermsController());
  }
}
