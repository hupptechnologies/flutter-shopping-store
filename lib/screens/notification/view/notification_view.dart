import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/notification/controller/notification_controller.dart';
import 'package:e_commerce/screens/notification/view/widget/notification_card_widget.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<NotificationController>(
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
          child: ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              final item = controller.list[index];
              return NotificationCardWidget(
                title: item['title']!,
                subTitle: item['subTitle']!,
              );
            },
          ),
        )),
      ),
    );
  }
}
