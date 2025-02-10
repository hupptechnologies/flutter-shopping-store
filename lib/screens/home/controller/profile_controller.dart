import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/enum/profile_menu_enum.dart';
import 'package:e_commerce/data/profile/profile_menu.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<ProfileMenu> menuList = [
    ProfileMenu(
        icon: ImageConstant.locationFillIcon,
        label: 'Address',
        type: ProfileMenuEnum.address),
    ProfileMenu(
        icon: ImageConstant.walletIcon,
        label: 'Payment method',
        type: ProfileMenuEnum.payment),
    ProfileMenu(
        icon: ImageConstant.tickeIcon,
        label: 'Voucher',
        type: ProfileMenuEnum.voucher),
    ProfileMenu(
        icon: ImageConstant.favoriteFillIcon,
        label: 'My Wishlist',
        type: ProfileMenuEnum.wishlist),
    ProfileMenu(
        icon: ImageConstant.starFillIcon,
        label: 'Rate this app',
        type: ProfileMenuEnum.rate),
    ProfileMenu(
        icon: ImageConstant.logoutIcon,
        label: 'Log out',
        type: ProfileMenuEnum.logout),
  ];

  void onTapMenu(ProfileMenuEnum menu) {
    if (kDebugMode) {
      print(menu);
    }
    switch (menu) {
      case ProfileMenuEnum.address:
        Get.toNamed(AppRoutes.address);
        return;
      case ProfileMenuEnum.payment:
        Get.toNamed(AppRoutes.payment);
        return;
      case ProfileMenuEnum.rate:
        Get.toNamed(AppRoutes.feedback);
        return;
      case ProfileMenuEnum.logout:
        Get.offAllNamed(AppRoutes.home);
      default:
        return;
    }
  }

  void onTapSetting() {
    Get.toNamed(AppRoutes.profileSetting);
  }
}
