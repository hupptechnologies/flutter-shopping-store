import 'package:e_commerce/screens/profile/feedback/controller/feedback_controller.dart';
import 'package:get/get.dart';

class FeedbackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedbackController>(() => FeedbackController());
  }
}
