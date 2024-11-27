import 'package:e_commerce/data/product/product.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late RxList<ProductDto> carts;
  late RxSet<int> selectingCart;

  @override
  void onInit() {
    findCart();
    selectingCart = <int>{}.obs;
    super.onInit();
  }

  void findCart() {
    final result = productDtoFromJson(DummyData.productList).sublist(0, 3);
    carts = RxList<ProductDto>(result);
  }

  void toggleSelectingCart(int id) {
    if (selectingCart.contains(id)) {
      selectingCart.remove(id);
    } else {
      selectingCart.add(id);
    }
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
