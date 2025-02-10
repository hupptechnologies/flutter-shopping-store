import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/widgets/drawer/view/widget/drawer_light_dark_mode_widget.dart';
import 'package:e_commerce/widgets/drawer/view/widget/drawer_navbar_list_widget.dart';
import 'package:e_commerce/widgets/drawer/view/widget/drawer_other_list_widget.dart';
import 'package:e_commerce/widgets/drawer/view/widget/drawer_profile_widget.dart';
import 'package:flutter/material.dart';

class CommonDrawerView extends StatelessWidget {
  const CommonDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          const DrawerProfileWidget(),
          const DrawerNavbarListWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: ListTile(
              title: const Text('OTHER'),
              titleTextStyle: TextStyle(
                color: AppColors.dartGratWithOpaity5,
                fontSize: 14,
              ),
            ),
          ),
          const DrawerOtherListWidget(),
          const Spacer(),
          const DrawerLightDarkModeWidget(),
        ],
      ),
    );
  }
}
