import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/appSetting/screens/notification/controller/setting_notification_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingNotificationView extends GetView<SettingNotificationController> {
  const SettingNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<SettingNotificationController>(
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Setting Notification',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: const Center(
              child: Text('Setting Notification'),
            ),
          ),
        ),
      ),
    );
  }
}
