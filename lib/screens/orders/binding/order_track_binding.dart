import 'package:e_commerce/screens/orders/controller/order_track_controller.dart';
import 'package:get/get.dart';

class OrderTrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderTrackController>(() => OrderTrackController());
  }

}