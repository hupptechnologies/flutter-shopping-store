import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/common/enum/profile_menu_enum.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/home/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MarginPadding.homeHorPadding,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 70),
              child: profileImageOrName(),
            ),
            profileMenu(),
          ],
        ),
      ),
    );
  }

  Widget profileMenu() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacityValue(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: controller.menuList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = controller.menuList[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () => controller.onTopMenu(item.type),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(item.icon, color: AppColors.dartGratWithOpaity5),
                      const SizedBox(width: 20),
                      Text(item.label),
                      const Spacer(),
                      if (item.type != ProfileMenuEnum.logout)
                        const Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              if (index != controller.menuList.length - 1) const Divider(),
            ],
          );
        },
      ),
    );
  }

  Widget profileImageOrName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(ImageConstant.category1),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sunie Pham',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('sunieux@gmail.com')
            ],
          ),
          const Spacer(),
          const Icon(Icons.settings),
        ],
      ),
    );
  }
}
