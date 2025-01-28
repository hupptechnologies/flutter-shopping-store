import 'package:e_commerce/common/enum/profile_menu_enum.dart';
import 'package:flutter/material.dart';

class ProfileMenu {
  IconData icon;
  String label;
  ProfileMenuEnum type;

  ProfileMenu({required this.icon, required this.label, required this.type});
}
