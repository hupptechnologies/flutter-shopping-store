import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/dto/category_query_dto.dart';
import 'package:e_commerce/common/dto/pagination.dart';
import 'package:e_commerce/dto/category_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class CategoryService extends BaseService {
  Future<ApiResponse<Pagination<CategoryDto>>> list(CategoryQueryDto query) async {
    return api.get(
      url: UrlConstant.category,
      queryParameters: query.toJson(),
      fromJsonT: (item) => Pagination.fromJson(
        item,
        (json) => categoryDtoFromJson(json),
      ),
    );
  }
}
