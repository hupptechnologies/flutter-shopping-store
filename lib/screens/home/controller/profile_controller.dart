import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/enum/profile_menu_enum.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/data/profile/profile_menu.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/auth_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthService authService = AuthService();

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
    switch (menu) {
      case ProfileMenuEnum.address:
        Get.toNamed(AppRoutes.address);
        return;
      case ProfileMenuEnum.payment:
        Get.toNamed(AppRoutes.payment);
        return;
      case ProfileMenuEnum.voucher:
        Get.toNamed(AppRoutes.voucher);
        return;
      case ProfileMenuEnum.wishlist:
        Get.toNamed(AppRoutes.wishlist);
        return;
      case ProfileMenuEnum.rate:
        Get.toNamed(AppRoutes.feedback);
        return;
      case ProfileMenuEnum.logout:
        logOut();
        return;
    }
  }

  Future<void> logOut() async {
    final respone = await authService.logout();
    Get.offAllNamed(AppRoutes.login);
    if (respone.error) {
      CommonSnackbar.error(respone.message);
    } else {
      CommonSnackbar.success(respone.message);
    }
  }

  void onTapSetting() {
    Get.toNamed(AppRoutes.profileSetting);
  }
}
