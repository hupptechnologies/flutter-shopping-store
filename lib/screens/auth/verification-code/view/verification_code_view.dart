import 'package:e_commerce/common/constant/app_icons.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/screens/auth/verification-code/controller/verification_code_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/build_otp_field.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeView extends GetView<VerificationCodeController> {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final controllers = [
      controller.controller1,
      controller.controller2,
      controller.controller3,
      controller.controller4,
    ];

    final focusNodes = [
      controller.focusNode1,
      controller.focusNode2,
      controller.focusNode3,
      controller.focusNode4,
    ];

    return PopScopeWrapper<VerificationCodeController>(
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
                          'Verification code',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        const Text(
                          "Please enter the verification code we sent to your email address",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        Center(
                          child: SizedBox(
                            width: screenWidth * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(4, (index) {
                                return BuildOtpField(
                                  controller: controllers[index],
                                  currentFocus: focusNodes[index],
                                  handleInputChange:
                                      controller.handleInputChange,
                                  nextFocus:
                                      index < 3 ? focusNodes[index + 1] : null,
                                  previousFocus:
                                      index > 0 ? focusNodes[index - 1] : null,
                                  autofocus: index == 0,
                                );
                              }),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: IconButton(
                            icon: const Icon(AppIcons.refresh),
                            onPressed: controller.resendOtp,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Center(
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Obx(
                              () => ButtonWidget(
                                title: 'OTP Verify',
                                isDisable: !controller.allFieldsFilled.value,
                                onPressed: controller.otpVerify,
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
