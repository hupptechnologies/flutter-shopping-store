import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/home/controller/dashboard_controller.dart';
import 'package:e_commerce/screens/home/view/widget/dashboard/dashboard_top_collection_text_with_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardTopColletion extends GetView<DashboardController> {
  const DashboardTopColletion({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 150;
    final EdgeInsetsGeometry textPadding = EdgeInsets.only(
      left: 40 - MarginPadding.homeHorPadding,
      right: 30,
    );
    return Obx(() {
      final data = controller.dashboardData.value;

      if (data.topCollections.isEmpty) return const SizedBox.shrink();

      return Column(
        children: [
          if (data.firstTopCollection != null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MarginPadding.homeHorPadding,
              ),
              child: GestureDetector(
                onTap: () => controller.gotoProductDetail(data.firstTopCollection!.id),
                child: DashboardTopCollectionTextWithImage(
                  height: height,
                  textPadding: textPadding,
                  title: data.firstTopCollection!.category!.name,
                  subTitle: data.firstTopCollection!.name,
                  subTitleFontSize: 22,
                  subTitleColor: Colors.black54,
                  image: data.firstTopCollection!.getImage,
                ),
              ),
            ),
          if (data.secondTopCollection != null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MarginPadding.homeHorPadding,
              ),
              child: GestureDetector(
                onTap: () => controller.gotoProductDetail(data.secondTopCollection!.id),
                child: DashboardTopCollectionTextWithImage(
                  height: height,
                  textPadding: textPadding,
                  title: data.secondTopCollection!.category!.name,
                  subTitle: data.secondTopCollection!.name,
                  subTitleFontSize: 22,
                  subTitleColor: Colors.black54,
                  image: data.secondTopCollection!.getImage,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: 10,
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  List.generate(data.thirdListTopCollection.length, (index) {
                final item = data.thirdListTopCollection[index];
                return Flexible(
                  child: GestureDetector(
                    onTap: () => controller.gotoProductDetail(item.id),
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        spacing: 5,
                        children: index.isEven
                            ? [
                                imageWidget(true, item.getImage),
                                textWidget(
                                  true,
                                  item.name,
                                  item.category!.name!,
                                )
                              ]
                            : [
                                textWidget(
                                  false,
                                  item.name,
                                  item.category!.name!,
                                ),
                                imageWidget(false, item.getImage)
                              ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      );
    });
  }

  Widget imageWidget(bool isLeft, String? image) => Flexible(
        flex: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
            left: isLeft ? const Radius.circular(15) : Radius.zero,
            right: !isLeft ? const Radius.circular(15) : Radius.zero,
          ),
          child: Image.network(
            image!,
            fit: BoxFit.fitHeight,
            height: 190,
          ),
        ),
      );

  Widget textWidget(bool isLeft, String name, String? categoryName) => Flexible(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.only(left: isLeft ? 0 : 3, right: isLeft ? 3 : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              if (categoryName != null)
                Text(
                  categoryName,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      );
}
