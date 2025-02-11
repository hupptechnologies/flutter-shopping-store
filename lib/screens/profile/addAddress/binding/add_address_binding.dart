import 'package:e_commerce/screens/profile/addAddress/controller/add_address_controller.dart';
import 'package:get/get.dart';

class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}
