import 'dart:io';

import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/dto/review_dto.dart';
import 'package:e_commerce/service/base_service.dart';
import 'package:dio/dio.dart';

class ReviewService extends BaseService {
  Future<ApiResponse> create(ReviewDto reviewDto, List<File> files) async {
    FormData formData = FormData.fromMap(reviewDto.toJson());

    List<MapEntry<String, MultipartFile>> multipartFiles = [];
    for (var file in files) {
      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );
      multipartFiles.add(MapEntry('images', multipartFile));
    }
    formData.files.addAll(multipartFiles);

    return api.post(url: UrlConstant.review, data: formData);
  }
}
