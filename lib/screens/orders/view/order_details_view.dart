import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/orders/controller/order_details_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                orderStatusCard(),
                const SizedBox(height: 20),
                orderDetailsCard(),
                const SizedBox(height: 50),
                orderBillingCard(),
                backOrRateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orderStatusCard() {
    return buildContainer(
      padding: 20,
      color: AppColors.darkGray,
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
    );
  }

  Widget orderDetailsCard() {
    return buildContainer(
      padding: 10,
      color: Colors.white,
      child: Column(
        children: [
          buildRow('Order number:', '#1514'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: buildRow('Tracking Number:', 'IK987362341'),
          ),
          buildRow('Delivery address:', 'SBI Building, Software Park'),
        ],
      ),
    );
  }

  Widget orderBillingCard() {
    return buildContainer(
      padding: 10,
      color: Colors.white,
      child: Column(
        children: [
          ListView.builder(
              itemCount: controller.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return buildBillingItemRow(
                  item['name']!,
                  item['quantity']!,
                  item['price']!,
                );
              }),
          const SizedBox(height: 30),
          buildRow('Sub Total', '120.00', isBold: true),
          const SizedBox(height: 8),
          buildRow('Shipping', '0.00', isBold: true),
          const SizedBox(height: 8),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: buildRow('Total', '\$120.00', isBold: true),
          ),
        ],
      ),
    );
  }

  Widget backOrRateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 6,
              child: ButtonWidget(
                isDisable: false,
                title: 'Return home',
                isBorder: true,
                verticalPadding: 12,
                onPressed: controller.returnHomePage,
              )),
          const SizedBox(width: 30),
          Expanded(
            flex: 4,
            child: ButtonWidget(
              title: 'Rate',
              isDisable: false,
              verticalPadding: 12,
              onPressed: controller.ratePage,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBillingItemRow(String name, String quantity, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 65, child: Text(name)),
          Expanded(
            flex: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(quantity),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: isBold ? null : AppColors.dartGratWithOpaity5)),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              value,
              style: TextStyle(fontWeight: isBold ? FontWeight.w600 : null),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContainer({
    required double padding,
    required Color color,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: color == Colors.white
            ? [
                BoxShadow(
                  color: AppColors.dartGratWithOpaity5,
                  blurRadius: 0.05,
                  spreadRadius: 0.01,
                )
              ]
            : null,
      ),
      child: child,
    );
  }
}
