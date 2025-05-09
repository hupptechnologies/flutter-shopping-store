import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/setting/controller/setting_controller.dart';
import 'package:e_commerce/screens/profile/setting/view/widget/select_profile.dart';
import 'package:e_commerce/screens/profile/setting/view/widget/setting_profile_form.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<SettingController>(
      isLoader: controller.userService.api.isLoader,
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Profile Setting',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: SelectProfile(),
                  ),
                  SizedBox(height: 60),
                  SettingProfileForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
