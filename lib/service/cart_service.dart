import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/requset/add_to_cart_req.dart';
import 'package:e_commerce/service/base_service.dart';

class CartService extends BaseService {
  Future<ApiResponse> addToCart(AddToCartReq addToCartReq) {
    return api.post(url: UrlConstant.cart, data: addToCartReq.toJson());
  }
}
