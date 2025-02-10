import 'package:e_commerce/screens/aboutUs/controller/about_as_controller.dart';
import 'package:get/get.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutAsController>(() => AboutAsController());
  }
}
