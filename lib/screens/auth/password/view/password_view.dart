import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/screens/auth/password/controller/password_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/build_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                        'Create new password',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      const Text(
                        "Your new password must be different  from previously used password",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: screenHeight * 0.08),
                      BuildTextField(
                        hintText: 'New Password',
                        controller: controller.passwordController,
                        validator: (value) =>
                            controller.validatePassword(value),
                        isObscure: true,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      BuildTextField(
                        hintText: 'Confirm Password',
                        controller: controller.confirmPasswordController,
                        validator: (value) =>
                            controller.validateConfirmPassword(value),
                        isObscure: true,
                      ),
                      SizedBox(height: screenHeight * 0.08),
                      Center(
                        child: Obx(
                          () => ElevatedButton(
                            onPressed: controller.isFormValid.value
                                ? controller.changePassword
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 13,
                              ),
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
    );
  }
}
