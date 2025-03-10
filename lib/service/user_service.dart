import 'dart:io';

import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/user/user_dto.dart';
import 'package:e_commerce/service/base_service.dart';
import 'package:dio/dio.dart' as dio;

class UserService extends BaseService {

  Future<ApiResponse<UserDto>> getProfile() async {
    return await api.get(
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

    return await api.patch(
      '${UrlConstant.user}/${userDto.id}',
      (data) => data,
      data: formData,
    );
  }
}
