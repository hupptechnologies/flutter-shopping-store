import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/appSetting/controller/app_setting_controller.dart';
import 'package:e_commerce/widgets/appbar/view/common_app_bar.dart';
import 'package:e_commerce/widgets/drawer/view/drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppSettingView extends GetView<AppSettingController> {
  const AppSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CommonAppBar(
          title: 'Settings',
          isNotication: false,
        ),
      ),
      drawer: const CommonDrawerView(),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
          ),
          children: List.generate(
            controller.list.length,
            (index) {
              final item = controller.list[index];
              return ListTile(
                onTap: () => Get.toNamed(item['path']),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 5,
                ),
                leading: SvgPicture.asset(item['icon']),
                title: Text(item['title']),
                trailing: SvgPicture.asset(ImageConstant.rightArrowIcon),
              );
            },
          ),
        ),
      ),
    );
  }
}
