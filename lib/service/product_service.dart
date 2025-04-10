import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/dto/dashboard_query_dto.dart';
import 'package:e_commerce/common/dto/pagination.dart';
import 'package:e_commerce/common/dto/product_query_dto.dart';
import 'package:e_commerce/dto/dashboard_dto.dart';
import 'package:e_commerce/dto/product_dto.dart';
import 'package:e_commerce/dto/wishlist_brands_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class ProductService extends BaseService {
  Future<ApiResponse<Pagination<ProductDto>>> list(
      ProductQueryDto query) async {
    return api.get(
      url: UrlConstant.product,
      queryParameters: query.toJson(),
      fromJsonT: (item) => Pagination.fromJson(
        item,
        (json) => productDtoFromJson(json),
      ),
    );
  }

  Future<ApiResponse<bool>> toggleFavorite(int id) async {
    return api.patch(url: [UrlConstant.wishlist, id.toString()]);
  }

  Future<ApiResponse<List<ProductDto>>> allFavorite() async {
    return api.get(
      url: UrlConstant.wishlist,
      fromJsonT: (json) => wishlistDtoFromJson(json),
    );
  }

  Future<ApiResponse<List<WishlistBrandsDto>>> allFavoriteBrands() async {
    return api.get(
      url: [UrlConstant.wishlist, UrlConstant.brands],
      fromJsonT: (json) => wishlistBrandsDtoFromJson(json),
    );
  }

  Future<ApiResponse<DashboardDto>> dashbaord(DashboardQueryDto query) async {
    return api.get(
      url: [UrlConstant.product, UrlConstant.all],
      queryParameters: query.toJson(),
      fromJsonT: (json) => DashboardDto.fromJson(json),
    );
  }

  Future<ApiResponse<ProductDto>> getById(int id) async {
    return api.get(
      url: [UrlConstant.product, id.toString()],
      fromJsonT: (json) => ProductDto.fromJson(json)
    );
  }
}
