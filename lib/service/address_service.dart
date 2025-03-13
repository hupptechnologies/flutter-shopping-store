import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/dto/address_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class AddressService extends BaseService {
  Future<ApiResponse<List<AddressDto>>> getAddresses() async {
    return api.get(
        url: UrlConstant.address,
        fromJsonT: (data) => addressDtoFromJson(data));
  }

  Future<ApiResponse<bool>> delete(int id) async {
    return api.delete(url: [UrlConstant.address, id.toString()]);
  }

  Future<ApiResponse> setDefaultAddress(int id) async {
    return api.patch(
      url: [UrlConstant.address, id.toString()],
      data: {'isDefault': true},
    );
  }

  Future<ApiResponse<AddressDto>> getById(String id) async {
    return api.get(
      url: [UrlConstant.address, id.toString()],
      fromJsonT: (address) => AddressDto.fromJson(address),
    );
  }

  Future<ApiResponse> createOrUpdate(AddressDto addressDto) async {
    final int id = addressDto.id;
    if (id == 0) {
      return api.post(
        url: UrlConstant.address,
        data: addressDto.toJson(),
      );
    }
    return api.patch(
      url: [UrlConstant.address, addressDto.id.toString()],
      data: addressDto.toJson(),
    );
  }
}
