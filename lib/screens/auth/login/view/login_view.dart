import 'package:e_commerce/screens/auth/login/controller/login_controller.dart';
import 'package:e_commerce/screens/auth/widget/form_text_field.dart';
import 'package:e_commerce/screens/auth/widget/other_login_or_sign_up.dart';
import 'package:e_commerce/widgets/button_widget.dart';
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
                    FormTextField(
                      hintText: 'Email',
                      validator: (value) => controller.loginReq
                          .validateField(value, fieldType: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) =>
                          controller.loginReq.updateField(email: value),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    FormTextField(
                      hintText: 'Password',
                      validator: (value) => controller.loginReq
                          .validateField(value, fieldType: 'Password'),
                      isObscure: true,
                      onChanged: (value) =>
                          controller.loginReq.updateField(password: value),
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
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Obx(
                          () => ButtonWidget(
                            title: 'SIGN IN',
                            isDisable: !controller.loginReq.isValid.value,
                            onPressed: controller.signIn,
                            isLoader: controller.authService.isLoader.value,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    OtherLoginOrSignUp(isLogin: true, onTap: controller.signUpPage),
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
