import 'package:e_commerce/screens/auth/password/controller/password_controller.dart';
import 'package:e_commerce/screens/auth/widget/form_text_field.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordForm extends GetView<PasswordController> {
  const PasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      spacing: screenHeight * 0.02,
      children: [
        FormTextField(
          hintText: 'New Password',
          validator: (value) => controller.passwordReq
              .validateField(value, fieldType: 'Password'),
          onChanged: (value) =>
              controller.passwordReq.updateField(password: value),
          isObscure: true,
        ),
        FormTextField(
          hintText: 'Confirm Password',
          validator: (value) => controller.passwordReq
              .validateField(value, fieldType: 'cPassword'),
          onChanged: (value) =>
              controller.passwordReq.updateField(cPassword: value),
          isObscure: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.06),
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Obx(
              () => ButtonWidget(
                title: 'Confirm',
                isDisable: !controller.passwordReq.isValid.value,
                onPressed: controller.changePassword,
                isLoader: controller.authService.apiService.isLoader.value,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
