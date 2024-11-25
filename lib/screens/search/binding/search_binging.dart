import 'package:e_commerce/screens/search/controller/search_controller.dart';
import 'package:e_commerce/widgets/drawer/controller/filter_controller.dart';
import 'package:get/get.dart';

class SearchBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomSearchController>(() => CustomSearchController());
    Get.lazyPut<FilterController>(() => FilterController());
  }
}
