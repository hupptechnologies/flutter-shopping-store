import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/screens/product/controller/product_detail_controller.dart';
import 'package:e_commerce/widgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProductDetailImages extends GetView<ProductDetailController> {
  const ProductDetailImages({super.key});

  @override
Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    child: Obx(() {
      final product = controller.productDto.value;
      final List<String> images = [];

      if (product?.images == null || product!.images!.isEmpty) {
        images.add("");
      } else {
        final List<String> imageUrls = product.images!.map((e) => e.url).toList();
        images.addAll(imageUrls);
      }

      return CarouselSlider(
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return ImageNetwork(
                url: image,
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          );
        }).toList(),
        carouselController: controller.carouselController,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.6,
          viewportFraction: 1.0,
          initialPage: controller.currentImage.value,
          autoPlay: false,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            controller.changeImage(index);
          },
        ),
      );
    }),
  );
}

}
