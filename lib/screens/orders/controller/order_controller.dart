import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/widgets/order_info_card_widget.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
   void onTapOrderDetails(OrderStatus orderStatus) {
    Get.toNamed(AppRoutes.orderDetails, arguments: { 'status': orderStatus });
  }
}
