import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildCircularIconButton extends StatelessWidget {
  const BuildCircularIconButton({
    super.key,
    required this.iconPath,
    this.onPressed,
  });
  final String iconPath;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          iconPath,
        ),
      ),
    );
  }
}
