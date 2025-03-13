import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/dto/address_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class AddressService extends BaseService {

  Future<ApiResponse<List<AddressDto>>> getAddresses() async {
    return api.get(
        UrlConstant.address, fromJsonT: (data) => addressDtoFromJson(data));
  }

  Future<ApiResponse<bool>> delete(int id) async {
    return api.delete('${UrlConstant.address}/$id');
  }

  Future<ApiResponse> setDefaultAddress(int id) async {
    return api.patch(
      '${UrlConstant.address}/$id',
      data: {'isDefault': true},
    );
  }

  Future<ApiResponse<AddressDto>> getById(String id) async {
    return api.get(
      '${UrlConstant.address}/$id',
      fromJsonT: (address) => AddressDto.fromJson(address),
    );
  }

  Future<ApiResponse> createOrUpdate(AddressDto addressDto) async {
    final int id = addressDto.id;
    if (id == 0) {
      return api.post(
        UrlConstant.address,
        data: addressDto.toJson(),
      );
    }
    return api.patch(
      '${UrlConstant.address}/${addressDto.id}',
      data: addressDto.toJson(),
    );
  }
}
