import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/widgets/order_info_card_widget.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final items = [
    {'name': 'Maxi Dress', 'quantity': 'x1', 'price': '\$68.00'},
    {'name': 'Linen Dress', 'quantity': 'x1', 'price': '\$52.00'},
  ];

  final Map<OrderStatus, Map<String, String>> statusMessages = {
    OrderStatus.PENDING: {
      "title": "Your order is on the way",
      "subtitle": "Click here to track your order.",
      "image": ImageConstant.pendingIcon,
    },
    OrderStatus.DELIVERED: {
      "title": "Your order is delivered",
      "subtitle": "Rate product to get 5 points for collect.",
      "image": ImageConstant.deliveredIcon
    },
    OrderStatus.CANCELLED: {
      "title": "Your order has been cancelled",
      "subtitle": "Sorry, something went wrong with your order.",
      "image": ImageConstant.cancelledIcon
    },
  };

  late Rx<OrderStatus> status = OrderStatus.PENDING.obs;

  Map<String, String> getStatusMessage() {
    return statusMessages[status.value]!;
  }

  @override
  void onReady() {
    final arguments = Get.arguments;
    status.value = arguments['status'];
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void returnHomePage() {
    Get.toNamed(AppRoutes.home);
    Get.delete<OrderDetailsController>();
  }

  void ratePage() {
    Get.toNamed(AppRoutes.home);
  }

  void goToOrderTrack () {
    if (status.value != OrderStatus.PENDING) {
      return;
    }
    print('Goto order Track page');
  }
}
