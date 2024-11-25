import 'dart:async';

import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/constant/image_constant.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Opacity(
          opacity: 0.5,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  image: const DecorationImage(
                    image: AssetImage(ImageConstant.splashScreen),
                    fit: BoxFit.cover,
                  ))),
        ));
  }
}
