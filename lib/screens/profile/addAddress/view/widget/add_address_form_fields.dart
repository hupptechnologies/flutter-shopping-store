import 'package:e_commerce/screens/profile/addAddress/controller/add_address_controller.dart';
import 'package:e_commerce/screens/profile/addAddress/view/widget/add_address_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressFormFields extends GetView<AddAddressController> {
  const AddAddressFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Obx(
          () => AddAddressTextField(
            label: "Receiver Name",
            isRequired: true,
            onChanged: (value) =>
                controller.addressDto.value.update(receiverName: value),
            value: controller.addressDto.value.receiverName,
          ),
        ),
        Obx(
          () => AddAddressTextField(
            label: "Street Name",
            onChanged: (value) =>
                controller.addressDto.value.update(street: value),
            value: controller.addressDto.value.street,
          ),
        ),
        Obx(
          () => AddAddressTextField(
            label: "Country",
            isRequired: true,
            onChanged: (value) =>
                controller.addressDto.value.update(country: value),
            value: controller.addressDto.value.country,
          ),
        ),
        Obx(
          () => AddAddressTextField(
            label: "City",
            isRequired: true,
            onChanged: (value) =>
                controller.addressDto.value.update(city: value),
            value: controller.addressDto.value.city,
          ),
        ),
        Obx(
          () => AddAddressTextField(
            label: "State / Province",
            isRequired: true,
            onChanged: (value) =>
                controller.addressDto.value.update(state: value),
            value: controller.addressDto.value.state,
          ),
        ),
        Obx(
          () => AddAddressTextField(
            label: "Zip-code",
            isRequired: true,
            isZipCode: true,
            onChanged: (value) =>
                controller.addressDto.value.update(zipCode: value),
            value: controller.addressDto.value.zipCode,
            keyboardType: TextInputType.number,
          ),
        ),
        Obx(
          () => AddAddressTextField(
            label: "Receiver Phone No",
            isRequired: true,
            isNumber: true,
            onChanged: (value) =>
                controller.addressDto.value.update(receiverPhone: value),
            value: controller.addressDto.value.receiverPhone,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
