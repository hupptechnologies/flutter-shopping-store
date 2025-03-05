import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/screens/auth/forget-password/controller/forget_password_controller.dart';
import 'package:e_commerce/screens/auth/widget/form_text_field.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return PopScopeWrapper<ForgetPasswordController>(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.07,
              left: screenWidth * 0.09,
              right: screenWidth * 0.09,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BuildBackButton(backPage: CommonGetX.backPage),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        const Text(
                          "Enter email assciated with your account and we'll send and email with intructions resset your password",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        Obx(
                          () => FormTextField(
                            hintText: 'Email',
                            validator: (value) => controller.forgetPasswordReq
                                .validateField(value),
                            onChanged: (value) => controller.forgetPasswordReq
                                .updateField(email: value),
                            keyboardType: TextInputType.emailAddress,
                            errorText:
                                controller.forgetPasswordReq.errors['email'],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.08),
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Obx(
                              () => ButtonWidget(
                                title: 'Forget Password',
                                isDisable:
                                    !controller.forgetPasswordReq.isValid.value,
                                onPressed: controller.forgetPassword,
                                isLoader: controller.authService.isLoader.value,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
