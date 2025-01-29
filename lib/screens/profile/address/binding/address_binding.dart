import 'package:e_commerce/screens/profile/address/controller/address_controller.dart';
import 'package:get/get.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
  }
}
