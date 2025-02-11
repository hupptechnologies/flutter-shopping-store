import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/auth/login/controller/login_controller.dart';
import 'package:e_commerce/widgets/build_text_field.dart';
import 'package:e_commerce/widgets/circular_icon_button.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return PopScopeWrapper<LoginController>(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.08,
              left: screenWidth * 0.08,
              right: screenWidth * 0.08,
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Log into',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    const Text(
                      'your account',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    BuildTextField(
                      hintText: 'Email',
                      controller: controller.emailController,
                      validator: (value) => controller.validateEmail(value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    BuildTextField(
                      hintText: 'Password',
                      controller: controller.passwordController,
                      validator: (value) => controller.validatePassword(value),
                      isObscure: true,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: controller.forgetPasswordPage,
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    Center(
                      child: Column(
                        children: [
                          Obx(
                            () => ElevatedButton(
                              onPressed: controller.isFormValid.value
                                  ? controller.signIn
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
                                  'SIGN IN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.05),
                          const Text('or login up with'),
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const BuildCircularIconButton(
                                iconPath: ImageConstant.mac,
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              const BuildCircularIconButton(
                                iconPath: ImageConstant.google,
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              const BuildCircularIconButton(
                                iconPath: ImageConstant.facebook,
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: controller.signUpPage,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
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
