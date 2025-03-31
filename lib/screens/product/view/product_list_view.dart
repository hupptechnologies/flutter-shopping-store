import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/common/utils/common_getx.dart';
import 'package:e_commerce/dto/product.dart';
import 'package:e_commerce/screens/product/controller/product_list_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:e_commerce/widgets/discount_price_widget.dart';
import 'package:e_commerce/widgets/drawer/view/filter_drawer_view.dart';
import 'package:e_commerce/widgets/favorite_widget.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawerView(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MarginPadding.homeHorPadding,
            vertical: MarginPadding.homeTopPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButtonOrTitleWidget(),
              textWithFilterWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: productListWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget backButtonOrTitleWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BuildBackButton(backPage: CommonGetX.backPage),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Obx(
            () => Text(
              controller.title.value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget textWithFilterWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Text(
              'Found ${controller.productList.length.toString()} Results',
              softWrap: true,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: SvgPicture.asset(ImageConstant.filterIcon),
            );
          }),
        ],
      ),
    );
  }

  Widget productListWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Obx(
        () => GridView.builder(
          itemCount: controller.productList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (context, index) {
            final Product item = controller.productList[index];
            return productWidget(item);
          },
        ),
      ),
    );
  }

  Widget productWidget(Product item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => controller.onTapProduct(item.id),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.lightGray,
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: FavoriteWidget(
                    isFavorite: item.isFavorite,
                    onPressed: () => controller.toggleFavorite(item.id),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          item.name!,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DiscountPriceWidget(
          discountPrice: item.discountPrice!,
          price: item.price!,
        ),
        RatingWidget(value: item.rating ?? 0)
      ],
    );
  }
}
