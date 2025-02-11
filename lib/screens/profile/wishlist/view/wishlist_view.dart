import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/wishlist/controller/wishlist_controller.dart';
import 'package:e_commerce/screens/profile/wishlist/view/widget/all_items_wishlist_widget.dart';
import 'package:e_commerce/screens/profile/wishlist/view/widget/boards_wishlist_widget.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<WishlistController>(
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'My Wishlist',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
            ),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: MarginPadding.homeTopPadding),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TabBar(
                      indicator: const BoxDecoration(color: AppColors.black),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      splashFactory: NoSplash.splashFactory,
                      dividerHeight: 0,
                      tabs: ['All items', 'Boards']
                          .map((el) => Tab(height: 34, child: Text(el)))
                          .toList(),
                    ),
                  ),
                  const Flexible(
                    child: TabBarView(
                      children: [
                        AllItemsWishlistWidget(),
                        BoardsWishlistWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
