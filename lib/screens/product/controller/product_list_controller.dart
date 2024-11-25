import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:e_commerce/extension/string_extensions.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  late RxList<ProductDto> productList = <ProductDto>[].obs;
  late RxString title = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    title.value = arguments['title'].toString().toFirstUppercase();
    productList.value = productDtoFromJson(DummyData.productList);
  }
}
