import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/common/types/form_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'Add or update address Key');

  final Map<String, FormType> fields = {
    'firstName': FormType(labelText: "First Name", isRequired: true),
    "lastName": FormType(labelText: "Last Name", isRequired: true),
    "streetName": FormType(labelText: "Street name"),
    "city": FormType(labelText: "City", isRequired: true),
    "state": FormType(labelText: "State / Province", isRequired: true),
    "zipCode": FormType(
      labelText: "Zip-code",
      keyboardType: TextInputType.number,
      isRequired: true,
    ),
    "phoneNumber": FormType(
      labelText: "Phone number",
      keyboardType: TextInputType.number,
      isRequired: true,
    ),
  };

  late Rx<AddressEnum> addressEnum = AddressEnum.home.obs;

  void setAddress(AddressEnum value) {
    addressEnum.value = value;
  }

  void addAddress() {
    if (formKey.currentState!.validate()) {
      Get.back();
    }
  }
}
