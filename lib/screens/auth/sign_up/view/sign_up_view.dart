import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/screens/auth/sign_up/controller/sign_up_controller.dart';
import 'package:e_commerce/screens/auth/sign_up/view/widgets/sign_up_form.dart';
import 'package:e_commerce/widgets/circular_icon_button.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScopeWrapper<SignUpController>(
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
                      'Create',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    const Text(
                      'your account',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    const SignUpForm(),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.05),
                          const Text('or sign up with'),
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
                          SizedBox(height: screenHeight * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: controller.loginPage,
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.05)
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
