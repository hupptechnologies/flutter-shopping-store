import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/service/base_service.dart';

class CategoryService extends BaseService {
  Future<ApiResponse> list() async {
    return api.get(url: UrlConstant.category);
  }
}