import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/address/address_dto.dart';
import 'package:e_commerce/service/api_service.dart';
import 'package:get/get.dart';

class AddressService {
  final ApiService apiService = Get.find<ApiService>();

  Future<ApiResponse<List<AddressDto>>> getAddresses() async {
    return apiService.get(
        UrlConstant.address, (data) => addressDtoFromJson(data));
  }

  Future<ApiResponse<bool>> delete(int id) async {
    return apiService.delete('${UrlConstant.address}/$id', (data) => data);
  }

  Future<ApiResponse> setDefaultAddress(int id) async {
    return apiService.patch(
      '${UrlConstant.address}/$id',
      (data) => data,
      data: {'isDefault': true},
    );
  }
}
