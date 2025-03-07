import 'package:e_commerce/common/enum/gender_enum.dart';
import 'package:e_commerce/screens/profile/setting/controller/setting_controller.dart';
import 'package:e_commerce/screens/profile/setting/view/widget/setting_text_field.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingProfileForm extends GetView<SettingController> {
  const SettingProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Obx(
                () => SettingTextField(
                  label: "First Name",
                  onChanged: (value) =>
                      controller.userDto.value.update(firstName: value),
                  value: controller.userDto.value.firstName,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Obx(
                () => SettingTextField(
                  label: "Last Name",
                  onChanged: (value) =>
                      controller.userDto.value.update(lastName: value),
                  value: controller.userDto.value.lastName,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(
          () => SettingTextField(
            label: "Email",
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => controller.userDto.value.update(email: value),
            value: controller.userDto.value.email,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Obx(
              () => Flexible(
                flex: 3,
                child: DropdownButtonFormField<Gender>(
                  value: controller.userDto.value.gender,
                  items: Gender.values
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender.name.capitalizeFirst!),
                          ))
                      .toList(),
                  decoration: const InputDecoration(labelText: "Gender"),
                  onChanged: (value) =>
                      controller.userDto.value.update(gender: value),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Obx(
              () => Flexible(
                flex: 7,
                child: SettingTextField(
                  label: "Phone Number",
                  keyboardType: TextInputType.phone,
                  onChanged: (value) =>
                      controller.userDto.value.update(mobileNumber: value),
                  value: controller.userDto.value.mobileNumber,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 90),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: ButtonWidget(
            title: 'Save change',
            isDisable: false,
            onPressed: controller.updateProfile,
          ),
        ),
      ],
    );
  }
}
