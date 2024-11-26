import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  late Rx<ProductDto> productDetail;
  late RxList<ProductDto> similarProducts;
  late RxList<String> colors;
  late RxList<Map<String, dynamic>> sizes = DummyData.sizes.obs;

  late RxSet<int> selectedColors = <int>{}.obs;
  late RxInt seletedSize = 0.obs;

  ProductDto get prodcut => productDetail.value;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments['id'];
    final int parsedId = id is int ? id : int.parse(id.toString());
    productDetail = Rx<ProductDto>(findByIdProduct(parsedId));
  }

  void toggleFavorite() {
    productDetail.value.isFavorite = !prodcut.isFavorite;
    productDetail.refresh();
  }

  void toggleColor(int index) {
    if (selectedColors.contains(index)) {
      selectedColors.remove(index);
    } else {
      selectedColors.add(index);
    }
  }

  void toggleSize(int id) {
    seletedSize.value = seletedSize.value == id ? 0 : id;
  }

  ProductDto findByIdProduct(int id) {
    final productList = productDtoFromJson(DummyData.productList);
    similarProducts = RxList<ProductDto>(productList);
    final product = productList.firstWhere(
      (item) => item.id == id,
      orElse: () => productList[0],
    );
    colors = RxList<String>(DummyData.colors.sublist(0, 3));
    return product;
  }
}
