import 'package:e_commerce/screens/product/controller/product_list_controller.dart';
import 'package:e_commerce/widgets/drawer/controller/filter_controller.dart';
import 'package:get/get.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductListController>(() => ProductListController());
    Get.lazyPut<FilterController>(() => FilterController());
  }
}
