import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:flutter/material.dart';

class BackButtonAppbarTitle extends StatelessWidget
    implements PreferredSizeWidget {
  final bool? centerTitle;
  final String? title;

  const BackButtonAppbarTitle({super.key, this.centerTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: centerTitle,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: MarginPadding.homeHorPadding),
        child: const BuildBackButton(),
      ),
      title: title != null && title!.isNotEmpty
          ? Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
