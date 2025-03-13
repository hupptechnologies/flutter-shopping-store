import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/address_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/address_service.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final AddressService addressService = AddressService();
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
    }
  }

  void setDefaultAddress(int id) async {
    await addressService.setDefaultAddress(id);
    for (var address in list) {
      address.isDefault = (address.id == id);
    }
    list.refresh();
  }

  Future<void> delete(int id) async {
    final response = await addressService.delete(id);
    if (!response.error) {
      list.removeWhere((address) => address.id == id);
      CommonSnackbar.success(response.message);
      return;
    }
    CommonSnackbar.error(response.message);
  }

  void editOrCreate(int? id) async {
    final bool result = await Get.toNamed(AppRoutes.addAddress, arguments: {
      'id': id,
    });

    if (result == true) {
      fetchAddressList();
    }
  }
}