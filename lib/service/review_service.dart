import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/dto/review_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class ReviewService extends BaseService {
  Future<ApiResponse> create(ReviewDto reviewDto) async {
    return api.post(url: UrlConstant.review, data: reviewDto.toJson());
  }
}
