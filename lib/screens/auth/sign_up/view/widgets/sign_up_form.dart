import 'package:e_commerce/screens/auth/sign_up/controller/sign_up_controller.dart';
import 'package:e_commerce/screens/auth/widget/form_text_field.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      spacing: screenHeight * 0.03,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: Obx(
                () => FormTextField(
                  hintText: 'First Name',
                  validator: (value) => controller.signUpReq.value
                      .validateField(value, fieldType: 'First Name'),
                  onChanged: (value) =>
                      controller.signUpReq.value.updateField(firstName: value),
                  errorText: controller.signUpReq.value.errors['firstName'],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => FormTextField(
                  hintText: 'Last Name',
                  validator: (value) => controller.signUpReq.value
                      .validateField(value, fieldType: 'Last Name'),
                  onChanged: (value) =>
                      controller.signUpReq.value.updateField(lastName: value),
                  errorText: controller.signUpReq.value.errors['lastName'],
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => FormTextField(
            hintText: 'Email address',
            validator: (value) => controller.signUpReq.value
                .validateField(value, fieldType: 'Email'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) =>
                controller.signUpReq.value.updateField(email: value),
            errorText: controller.signUpReq.value.errors['email'],
          ),
        ),
        Obx(
          () => FormTextField(
            hintText: 'Password',
            validator: (value) => controller.signUpReq.value
                .validateField(value, fieldType: 'Password'),
            isObscure: true,
            onChanged: (value) =>
                controller.signUpReq.value.updateField(password: value),
            errorText: controller.signUpReq.value.errors['password'],
          ),
        ),
        FormTextField(
          hintText: 'Confirm Password',
          validator: (value) => controller.signUpReq.value
              .validateField(value, fieldType: 'Confirm Password'),
          isObscure: true,
          onChanged: (value) =>
              controller.signUpReq.value.updateField(confirmPassword: value),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Obx(
              () => ButtonWidget(
                title: 'SIGN UP',
                isDisable: !controller.signUpReq.value.isValid.value,
                onPressed: controller.signUp,
                isLoader: controller.authService.apiService.isLoader.value,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
