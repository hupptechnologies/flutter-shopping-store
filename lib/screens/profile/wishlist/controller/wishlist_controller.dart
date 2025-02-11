import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  late RxList<ProductDto> allItems = <ProductDto>[].obs;
  late RxList boardsList = [].obs;

  @override
  void onInit() {
    super.onInit();
    final List<ProductDto> items = productDtoFromJson(DummyData.productList);
    for (var el in items) {
      el.isFavorite = true;
    }
    allItems.value = items;
    boardsList.value = DummyData.boardsList;
  }

  void toggleFavorite(int id) {
    final index = allItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (allItems[index].isFavorite) {
        allItems.removeAt(index);
      } else {
        allItems[index].isFavorite = true;
      }
      allItems.refresh();
    }
  }

  void onTapProduct(int id) {
    Get.toNamed(AppRoutes.productDetail, arguments: {'id': id});
  }
}
