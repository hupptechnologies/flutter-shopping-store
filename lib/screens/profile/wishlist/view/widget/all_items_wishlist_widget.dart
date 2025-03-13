import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/screens/profile/wishlist/controller/wishlist_controller.dart';
import 'package:e_commerce/widgets/discount_price_widget.dart';
import 'package:e_commerce/widgets/favorite_widget.dart';
import 'package:e_commerce/widgets/no_records_widget.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllItemsWishlistWidget extends GetView<WishlistController> {
  const AllItemsWishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      padding: const EdgeInsets.only(top: 24),
      child: Obx(
        () {
          if (controller.allItems.isEmpty) {
            return const NoRecordsWidget();
          }

          return GridView.builder(
            itemCount: controller.allItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 0.54,
            ),
            itemBuilder: (context, index) {
              final ProductDto item = controller.allItems[index];
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
                              onPressed: () =>
                                  controller.toggleFavorite(item.id),
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
            },
          );
        },
      ),
    );
  }
}
