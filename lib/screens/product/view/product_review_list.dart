import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/product/controller/product_review_list_controller.dart';
import 'package:e_commerce/screens/product/view/widgets/reivewSection/review_section_users_reviews.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductReviewList extends GetView<ProductReviewListController> {
  const ProductReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<ProductReviewListController>(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Obx(() {
            return BackButtonAppbarTitle(
              title: controller.title.value ?? 'Reviews',
              centerTitle: true,
            );
          }),
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
                  Obx(() {
                    final reviews = controller.reviews.value;
                    return ReviewSectionUsersReviews(reviews: reviews);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
