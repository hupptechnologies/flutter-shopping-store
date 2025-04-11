import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/requset/add_to_cart_req.dart';
import 'package:e_commerce/dto/your_cart_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class CartService extends BaseService {
  Future<ApiResponse> addToCart(AddToCartReq addToCartReq) {
    return api.post(url: UrlConstant.cart, data: addToCartReq.toJson());
  }

  Future<ApiResponse<YourCartDto>> list() {
    return api.get(
      url: UrlConstant.cart,
      fromJsonT: (data) => YourCartDto.fromJson(data),
    );
  }

  Future<ApiResponse<YourCartDto>> toggleSelecting(int id, bool isSelected) {
    return api.patch(
      url: [UrlConstant.cart, id.toString()],
      data: {'isSelected': isSelected},
      fromJsonT: (data) => YourCartDto.fromJson(data),
    );
  }
}
