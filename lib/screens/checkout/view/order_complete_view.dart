import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderCompleteView extends StatelessWidget {
  const OrderCompleteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
        vertical: MarginPadding.homeTopPadding,
      ),
      child: SizedBox(
        height: Get.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(ImageConstant.orderIcon),
            const Text(
              'Thank you for your purchase.\n You can view your order in ‘My Orders’ \n section.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const ButtonWidget(
              title: 'Continue shopping',
              isDisable: false,
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
