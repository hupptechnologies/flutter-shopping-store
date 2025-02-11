import 'package:e_commerce/screens/profile/wishlist/controller/wishlist_controller.dart';
import 'package:e_commerce/screens/profile/wishlist/view/widget/boards_items_wishlist.dart';
import 'package:e_commerce/widgets/no_records_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardsWishlistWidget extends GetView<WishlistController> {
  const BoardsWishlistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        child: Obx(() {
          if (controller.boardsList.isEmpty) {
            return const NoRecordsWidget();
          }

          return ListView.builder(
            itemCount: controller.boardsList.length,
            itemBuilder: (context, index) {
              final item = controller.boardsList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BoardsItemsWishlist(
                  title: item['title'],
                  conunt: item['conunt'],
                  firstImage: item['firstImage'],
                  secoundImage: item['secoundImage'],
                  thirdImages: item['thirdImages'],
                ),
              );
            },
          );
        }));
  }
}
