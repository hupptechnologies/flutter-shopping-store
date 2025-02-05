import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  final List<String> creditCardList = [
    ImageConstant.payPalIcon,
    ImageConstant.visaIcon,
    ImageConstant.mastercardIcon,
    ImageConstant.alipayIcon,
    ImageConstant.amexIcon,
  ];
}
