import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/product.dart';
import 'package:e_commerce/dto/your_cart_dto.dart';
import 'package:e_commerce/dummydata/dummy_data.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartService cartService = CartService();
  final Rxn<YourCartDto> yourCartDto = Rxn<YourCartDto>();

  late RxList<Product> carts;
  late RxSet<int> selectingCart;
  late RxInt productPrice = 0.obs;

  @override
  void onInit() {
    findCart();
    selectingCart = <int>{}.obs;
    Future.microtask(() => fetchAllCarts());
    super.onInit();
  }

  void findCart() {
    final result = productFromJson(DummyData.productList).sublist(0, 4);
    carts = RxList<Product>(result);
  }

  Future<void> toggleSelectingCart(int id) async {
    final cart =
        yourCartDto.value?.carts.firstWhereOrNull((cart) => cart.id == id);
    if (cart == null) return;

    final response = await cartService.toggleSelecting(id, !cart.isSelected);
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    yourCartDto.value = response.data;
  }

  void proceedToCheckout() {
    Get.toNamed(AppRoutes.checkout);
  }

  Future<void> updateQuantity(int id, bool isIncrement) async {
    final response = await cartService.updateQuantity(id, isIncrement ? 1 : -1);
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    yourCartDto.value = response.data;
  }

  Future<void> fetchAllCarts() async {
    final response = await cartService.list();
    if (!response.error) {
      yourCartDto.value = response.data;
    }
  }
}
