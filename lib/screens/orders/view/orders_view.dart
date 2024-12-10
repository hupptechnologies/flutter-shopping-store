import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/string_extensions.dart';
import 'package:e_commerce/widgets/order_info_card_widget.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MarginPadding.homeHorPadding),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              isScrollable: false,
              tabs: OrderStatus.values.map((value) {
                return tab(value.name.toFirstLatterUppercase());
              }).toList(),
              dividerHeight: 0,
              indicator: ShapeDecoration(
                color: AppColors.darkGray,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            Flexible(
              child: TabBarView(
                children: OrderStatus.values.map((value) {
                  return orderList(value);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tab(String text) {
    return Tab(
      height: 35,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget orderList(OrderStatus status) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 2,
            ),
            child: OrderInfoCardWidget(
              date: '13/05/2024',
              orderNumber: '1100',
              quantity: 2,
              status: status,
              subtotal: 100,
              trackingNumber: 'IK12457524',
            ),
          );
        },
      ),
    );
  }
}
