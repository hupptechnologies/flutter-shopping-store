import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/forms_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/checkout/controller/shipping_controller.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ShippingView extends GetView<ShippingController> {
  final Function? nextStep;

  const ShippingView({
    super.key,
    required this.nextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...shippingFormWidget(),
          const SizedBox(height: 30),
          ...shippingMethodWidget(),
          const SizedBox(height: 30),
          ...couponCodeWidget(),
          const SizedBox(height: 30),
          ...billingAddressWidget(),
          const SizedBox(height: 30),
          Obx(
            () => ButtonWidget(
              title: 'Continue to payment',
              onPressed: nextStep,
              isDisable: !controller.isContinuePayment,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  List<Widget> shippingFormWidget() {
    return FormsConstant.addressFields.map(
      (field) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Obx(
            () {
              String key = field['key'];
              String? errorText = controller.addressErrors[key];
              bool required = field['required'] ?? false;
              String label = field['label'] + (required ? ' *' : '');
              bool isNumber = field['isNumber'] ?? false;
              List<TextInputFormatter>? inputFormatters;
              List<Map<String, String>> item = field['item'] ?? [];

              if (isNumber) {
                int maxLength = field['maxLength'];
                inputFormatters = [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(maxLength),
                ];
              }

              if (item.isNotEmpty) {
                return dropdownButtonFormFieldWidget(
                  key: key,
                  label: label,
                  item: item,
                  required: required,
                );
              }

              return textFormFieldWidget(
                key: key,
                errorText: errorText,
                isNumber: isNumber,
                label: label,
                required: required,
                inputFormatters: inputFormatters,
              );
            },
          ),
        );
      },
    ).toList();
  }

  Widget dropdownButtonFormFieldWidget({
    required String key,
    required String label,
    required List<Map<String, String>> item,
    required bool required,
  }) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      items: item.map((el) {
        return DropdownMenuItem<String>(
          value: el['value'],
          child: Text(el['lable']!),
        );
      }).toList(),
      menuMaxHeight: 250,
      borderRadius: BorderRadius.circular(10),
      onChanged: (String? value) {
        controller.addressFieldValidation(
          key,
          value!,
          required,
        );
      },
      alignment: Alignment.centerLeft,
    );
  }

  Widget textFormFieldWidget({
    required String key,
    required bool isNumber,
    List<TextInputFormatter>? inputFormatters,
    required String label,
    String? errorText,
    required bool required,
  }) {
    return TextFormField(
      initialValue: controller.address.value.toMap()[key],
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 14),
        errorText: errorText,
      ),
      onChanged: (value) {
        controller.addressFieldValidation(
          key,
          value,
          required,
        );
      },
    );
  }

  Widget titleText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  List<Widget> shippingMethodWidget() {
    return [
      titleText('Shipping method'),
      ...FormsConstant.shippingMethods.map(
        (item) => radioListTileWidget(
          value: item['value']!,
          title: item['title']!,
          subTitle: item['subTitle']!,
        ),
      ),
    ];
  }

  Widget radioListTileWidget({
    required String value,
    required String title,
    required String subTitle,
  }) {
    return Obx(
      () => RadioListTile<String>(
        value: value,
        groupValue: controller.selectedShippingMethod.value,
        onChanged: controller.changeShippingMethod,
        title: Text(title),
        subtitle: Text(subTitle),
        contentPadding: EdgeInsets.zero,
        activeColor: AppColors.lightGreen,
      ),
    );
  }

  List<Widget> couponCodeWidget() {
    return [
      titleText('Coupon Code'),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.lightGray.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Have a code? type it here...",
                    hintStyle: TextStyle(
                        color: AppColors.dartGratWithOpaity5, fontSize: 12),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
              const TextButton(
                onPressed: null,
                child: Text(
                  'Validate',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.lightGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ];
  }

  List<Widget> billingAddressWidget() {
    return [
      titleText('Billing Address'),
      Obx(
        () => CheckboxListTile(
          value: controller.isBillingAddress.value,
          onChanged: controller.changeBillingAddress,
          title: const Text('Copy address data from shipping'),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: AppColors.lightGreen,
        ),
      ),
    ];
  }
}
