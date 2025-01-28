import 'package:e_commerce/common/enum/profile_menu_enum.dart';
import 'package:e_commerce/data/profile/profile_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<ProfileMenu> menuList = [
    ProfileMenu(
        icon: Icons.location_on,
        label: 'Address',
        type: ProfileMenuEnum.address),
    ProfileMenu(
        icon: Icons.payments,
        label: 'Payment method',
        type: ProfileMenuEnum.payment),
    ProfileMenu(
        icon: Icons.confirmation_number_sharp,
        label: 'Voucher',
        type: ProfileMenuEnum.voucher),
    ProfileMenu(
        icon: Icons.favorite_rounded,
        label: 'My Wishlist',
        type: ProfileMenuEnum.wishlist),
    ProfileMenu(
        icon: Icons.star_rate_rounded,
        label: 'Rate this app',
        type: ProfileMenuEnum.rate),
    ProfileMenu(
        icon: Icons.logout_rounded,
        label: 'Log out',
        type: ProfileMenuEnum.logout),
  ];

  void onTopMenu(ProfileMenuEnum menu) {
    if (kDebugMode) {
      print(menu);
    }
  }
}
