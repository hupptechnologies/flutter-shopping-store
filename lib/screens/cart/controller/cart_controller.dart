import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late RxList<ProductDto> carts;
  late RxSet<int> selectingCart;
  late RxInt productPrice = 0.obs;

  @override
  void onInit() {
    findCart();
    selectingCart = <int>{}.obs;
    super.onInit();
  }

  void findCart() {
    final result = productDtoFromJson(DummyData.productList).sublist(0, 4);
    carts = RxList<ProductDto>(result);
  }

  void toggleSelectingCart(int id) {
    if (selectingCart.contains(id)) {
      selectingCart.remove(id);
    } else {
      selectingCart.add(id);
    }
    sumProductPrice();
  }

  void sumProductPrice() {
    final total = carts
        .where((item) => selectingCart.contains(item.id))
        .map((item) => item.discountPrice ?? 0)
        .fold(0.0, (sum, price) => sum + price);

    productPrice.value = total.toInt();
  }

  void proceedToCheckout() {
    Get.toNamed(AppRoutes.checkout);
  }

  void incrementDecrementQuantity(int id, bool isIncrement) {
    final cart = carts.firstWhere((item) => item.id == id);

    if (isIncrement) {
      cart.quantity = (cart.quantity) + 1;
    } else if (cart.quantity > 0) {
      cart.quantity = (cart.quantity) - 1;
    }
    carts.refresh();
  }
}
