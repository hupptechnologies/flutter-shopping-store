import 'package:e_commerce/screens/rating/controller/rating_controller.dart';
import 'package:get/get.dart';

class RatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingController>(() => RatingController());
  }
}