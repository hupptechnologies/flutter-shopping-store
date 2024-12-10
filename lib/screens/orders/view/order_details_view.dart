import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbarTitle(
        title: 'Order #1000',
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
            vertical: MarginPadding.homeTopPadding,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.darkGray,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your order is delivered',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Rate product to get 5 points for collect.',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                    SvgPicture.asset(ImageConstant.deliveredIcon)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
