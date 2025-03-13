import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/data/order_track_dto.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/orders/controller/order_track_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderTrackView extends GetView<OrderTrackController> {
  const OrderTrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbarTitle(
        title: 'Track Order',
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
            vertical: MarginPadding.homeTopPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                labelValueRow('Delivered on', '15.05.21'),
                const SizedBox(height: 10),
                labelValueRow('Tracking Number :', 'IK287368838'),
                const SizedBox(height: 30),
                generateTrack(),
                const SizedBox(height: 40),
                dontForgetRate(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dontForgetRate() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacityValue(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: List.generate(3, (index) {
                  final bool isTranslated =
                      index == 0 || index == 2; // First and last icons
                  return Transform.translate(
                    offset: isTranslated ? const Offset(0, 10) : Offset.zero,
                    child: const Icon(
                      Icons.star_outline_rounded,
                      size: 20,
                      color: AppColors.orangeAccent,
                    ),
                  );
                }),
              ),
              SvgPicture.asset(ImageConstant.clickHandIcon),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Don’t forget to rate',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Rate product to get 5 points for collect.',
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Transform.translate(
                offset: const Offset(-5, 0),
                child: const RatingWidget(
                  value: 0,
                  size: 25,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget generateTrack() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.orderTracker.length,
      itemBuilder: (context, index) {
        final item = controller.orderTracker[index];
        final isLast = controller.orderTracker.length == index + 1;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [trackRow(item), if (!isLast) emptyDot()],
        );
      },
    );
  }

  Widget trackRow(OrderTrackDto item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.darkGray, width: 1.5),
          ),
          child: Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkGray,
            ),
            child: item.parse
                ? const Icon(
                    Icons.done_rounded,
                    size: 10,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Text(item.label,
                      overflow: TextOverflow.ellipsis, maxLines: 1),
                ),
              ),
              Text(
                item.date,
                style: TextStyle(color: AppColors.dartGratWithOpaity5),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget emptyDot() {
    return Column(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkGray,
            ),
          ),
        ),
      ),
    );
  }

  Widget labelValueRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Text(
            '$label ',
            style: TextStyle(color: AppColors.dartGratWithOpaity5),
          ),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
