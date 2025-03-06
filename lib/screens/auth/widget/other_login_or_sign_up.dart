import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';

class OtherLoginOrSignUp extends StatelessWidget {
  final bool isLogin;
  final void Function()? onTap;

  OtherLoginOrSignUp({
    super.key,
    this.isLogin = false,
    required this.onTap,
  });

  final List<String> icons = [
    ImageConstant.mac,
    ImageConstant.google,
    ImageConstant.facebook,
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        spacing: screenHeight * 0.02,
        children: [
          Text('or ${isLogin ? 'login' : 'sign up'} up with'),
          Row(
            spacing: screenWidth * 0.05,
            mainAxisAlignment: MainAxisAlignment.center,
            children: icons
                .map((icon) => BuildCircularIconButton(iconPath: icon))
                .toList(),
          ),
          SizedBox(height: screenHeight * (isLogin ? 0.06 : 0.01)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogin
                    ? 'Don\'t have an account? '
                    : 'Already have an account? ',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  isLogin ? 'Sign Up' : 'Log In',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
