import 'dart:io';

import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/api_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class UserService {
  final ApiService apiService = Get.find<ApiService>();

  Future<ApiResponse<UserDto>> getProfile() async {
    return await apiService.get(
      UrlConstant.getProfile,
      (data) => UserDto.fromJson(data),
    );
  }

  Future<ApiResponse> updateUser(UserDto userDto, File? imageFile) async {
    final Map<String, dynamic> data = userDto.toJson();
    dio.FormData formData = dio.FormData.fromMap(data);

    if (imageFile != null) {
      formData.files.add(MapEntry(
        'image',
        await dio.MultipartFile.fromFile(
          imageFile.path,
          filename: 'profile.jpg',
        ),
      ));
    }

    return await apiService.patch(
      '${UrlConstant.user}/${userDto.id}',
      (data) => data,
      data: formData,
    );
  }
}
