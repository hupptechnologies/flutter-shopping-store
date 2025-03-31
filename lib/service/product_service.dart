import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/dto/pagination.dart';
import 'package:e_commerce/common/dto/product_query_dto.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class ProductService extends BaseService {

  Future<ApiResponse<Pagination<ProductDto>>> list(ProductQueryDto query) async {
    return api.get(
      url: UrlConstant.product,
      queryParameters: query.toJson(),
      fromJsonT: (item) => Pagination.fromJson(
        item,
        (json) => productDtoFromJson(json),
      ),
    );
  }
}