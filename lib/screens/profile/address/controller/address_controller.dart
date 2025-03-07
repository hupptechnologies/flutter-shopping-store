import 'package:e_commerce/data/address/address_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/address_service.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final AddressService addressService = AddressService();
  var selectedAddressId = 0.obs;

  final RxList<AddressDto> list = RxList<AddressDto>();

  @override
  void onInit() {
    fetchAddressList();
    super.onInit();
  }

  Future<void> fetchAddressList() async {
    final response = await addressService.getAddresses();
    if (!response.error) {
      list.assignAll(response.data!);
      selectedAddressId.value = list.first.id;
    }
  }

  void onChangeDefalutAddress(int id) {
    selectedAddressId.value = id;
    for (var address in list) {
      address.isDefault = address.id == id;
    }
    update();
  }

  void gotoAddAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }
}
