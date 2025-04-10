import 'package:e_commerce/screens/product/controller/product_review_list_controller.dart';
import 'package:get/get.dart';

class ProductReviewListBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductReviewListController>(
        () => ProductReviewListController());
  }
}
