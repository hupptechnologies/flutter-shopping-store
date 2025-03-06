import 'package:e_commerce/screens/auth/sign_up/controller/sign_up_controller.dart';
import 'package:e_commerce/screens/auth/sign_up/view/widgets/sign_up_form.dart';
import 'package:e_commerce/screens/auth/widget/other_login_or_sign_up.dart';
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
                    SizedBox(height: screenHeight * 0.05),
                    OtherLoginOrSignUp(onTap: controller.loginPage),
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
