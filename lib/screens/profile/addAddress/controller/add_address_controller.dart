import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/data/address/address_dto.dart';
import 'package:e_commerce/service/address_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  final AddressService addressService = AddressService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<AddressDto> addressDto = Rx<AddressDto>(AddressDto());
  final RxBool isEditMode = false.obs;

  Future<void> saveAddress() async {
    if (formKey.currentState!.validate()) {
      final response = await addressService.createOrUpdate(addressDto.value);
      if (response.error) {
        CommonSnackbar.error(response.message);
        return;
      }
      Get.back(result: true);
      CommonSnackbar.success(response.message);
    }
  }

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments['id'];

    if (id != null) {
      isEditMode.value = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getAddressDetails(id);
      });
    }
  }

  Future<void> getAddressDetails(dynamic id) async {
    final id = Get.arguments['id'];

    final response = await addressService.getById(id.toString());
    if (!response.error) {
      addressDto.value = response.data!;
      return;
    }
    CommonSnackbar.error(response.message);
  }
}
