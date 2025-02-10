import 'package:e_commerce/common/constant/app_colors.dart';
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
          title: 'Notification',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  final item = controller.list[index];

                  return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        item['subTitle'],
                        style: const TextStyle(fontSize: 10),
                      ),
                      trailing: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: item['value'],
                          activeTrackColor: AppColors.lightGreen,
                          onChanged: (value) =>
                              controller.onChangeValue(item['id'], value),
                        ),
                      ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
