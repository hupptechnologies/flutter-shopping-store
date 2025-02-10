import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerListItemWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;
  final String icon;

  const DrawerListItemWidget({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      titleTextStyle: TextStyle(
        color: AppColors.dartGratWithOpaity5,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      selectedTileColor: AppColors.lightGray,
      selectedColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      selected: isSelected,
      leading: SvgPicture.asset(
        icon,
        width: 22,
        height: 22,
        color: isSelected ? Colors.black : AppColors.dartGratWithOpaity5,
      ),
    );
  }
}
