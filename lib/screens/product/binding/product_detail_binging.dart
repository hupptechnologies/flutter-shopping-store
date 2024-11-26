import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}
