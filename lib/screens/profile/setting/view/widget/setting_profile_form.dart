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
              child: SettingTextField(
                controller: controller.firstNameController,
                label: "First Name",
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SettingTextField(
                controller: controller.lastNameController,
                label: "Last Name",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SettingTextField(
          controller: controller.emailController,
          label: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Flexible(
              flex: 3,
              child: DropdownButtonFormField<Gender>(
                value: controller.selectedGender.value,
                items: Gender.values
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender.name.capitalizeFirst!),
                        ))
                    .toList(),
                decoration: const InputDecoration(labelText: "Gender"),
                onChanged: (value) => controller.selectedGender.value = value,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 7,
              child: SettingTextField(
                controller: controller.phoneController,
                label: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 90),
        ButtonWidget(
          title: 'Save change',
          isDisable: false,
          verticalPadding: 12,
          onPressed: controller.saveChange,
        ),
      ],
    );
  }
}
