import 'package:e_commerce/common/enum/profile_menu_enum.dart';

class ProfileMenuDto {
  String icon;
  String label;
  ProfileMenuEnum type;

  ProfileMenuDto({required this.icon, required this.label, required this.type});
}
