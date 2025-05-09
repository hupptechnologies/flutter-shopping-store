import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/widgets/appbar/controller/appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CommonAppBar extends GetView<AppbarController>
    implements PreferredSizeWidget {
  final String title;
  final bool isNotication;
  const CommonAppBar({
    super.key,
    required this.title,
    this.isNotication = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: SvgPicture.asset(ImageConstant.menuIcon),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        if (isNotication)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Obx(() => Stack(
                  children: [
                    IconButton(
                      onPressed: controller.gotoNotification,
                      icon: SvgPicture.asset(ImageConstant.bellIcon),
                    ),
                    if (controller.notificationCount.value > 0)
                      const Positioned(
                        right: 14,
                        top: 14,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                  ],
                )),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
