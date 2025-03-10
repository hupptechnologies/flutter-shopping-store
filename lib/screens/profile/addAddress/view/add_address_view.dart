import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/screens/profile/addAddress/controller/add_address_controller.dart';
import 'package:e_commerce/screens/profile/addAddress/view/widget/add_address_form_fields.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<AddAddressController>(
      isLoader: controller.addressService.apiService.isLoader,
      child: Scaffold(
        appBar: BackButtonAppbarTitle(
          title: controller.isEditMode.value ? "Edit Address" : "Add Address",
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  spacing: 10,
                  children: [
                    const AddAddressFormFields(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            "Address Type:",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Obx(
                          () => Row(
                            children: AddressEnum.values
                                .map((address) => GestureDetector(
                                      onTap: () {
                                        controller.addressDto.value
                                            .update(type: address);
                                        controller.addressDto.refresh();
                                      },
                                      child: Row(
                                        children: [
                                          Radio<AddressEnum>(
                                            visualDensity: const VisualDensity(
                                                vertical: -4),
                                            value: address,
                                            groupValue: controller
                                                .addressDto.value.type,
                                            onChanged: (value) {
                                              if (value != null) {
                                                controller.addressDto.value
                                                    .update(type: value);
                                                controller.addressDto.refresh();
                                              }
                                            },
                                          ),
                                          Text(address.name.capitalizeFirst ??
                                              ''),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ButtonWidget(
                          title: controller.isEditMode.value
                              ? "Edit Address"
                              : "Add Address",
                          isDisable: false,
                          onPressed: controller.saveAddress,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
