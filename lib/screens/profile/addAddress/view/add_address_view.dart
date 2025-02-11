import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/screens/profile/addAddress/controller/add_address_controller.dart';
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
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          title: 'Add Address',
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
                    ...controller.fields.entries.map((field) {
                      return TextFormField(
                        controller: field.value.controller,
                        decoration: InputDecoration(
                          label: RichText(
                            text: TextSpan(
                              text: field.value.labelText,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: field.value.isRequired
                                  ? [
                                      const TextSpan(
                                        text: " *",
                                        style:
                                            TextStyle(color: AppColors.offRed),
                                      ),
                                    ]
                                  : [],
                            ),
                          ),
                        ),
                        keyboardType: field.value.keyboardType,
                        validator: (value) {
                          if (field.value.isRequired &&
                              (value == null || value.trim().isEmpty)) {
                            return "${field.value.labelText} is required";
                          }
                          return null;
                        },
                      );
                    }),
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
                        Obx(() => Row(
                              children: AddressEnum.values
                                  .map((address) => GestureDetector(
                                        onTap: () =>
                                            controller.setAddress(address),
                                        child: Row(
                                          children: [
                                            Radio<AddressEnum>(
                                              visualDensity:
                                                  const VisualDensity(
                                                vertical: -4,
                                              ),
                                              value: address,
                                              groupValue:
                                                  controller.addressEnum.value,
                                              onChanged: (value) =>
                                                  controller.setAddress(value!),
                                            ),
                                            Text(address.name.capitalizeFirst ??
                                                ''),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ButtonWidget(
                          title: 'Add address',
                          isDisable: false,
                          onPressed: controller.addAddress,
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
