import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/api_service.dart';
import 'package:get/get.dart';

class UserService {
  final ApiService apiService = Get.find<ApiService>();

  Future<ApiResponse<UserDto>> getProfile() async {
    return await apiService.get(
      UrlConstant.getProfile,
      (data) => UserDto.fromJson(data),
    );
  }
}
