import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/data/address_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class AddressService extends BaseService {

  Future<ApiResponse<List<AddressDto>>> getAddresses() async {
    return api.get(
        UrlConstant.address, (data) => addressDtoFromJson(data));
  }

  Future<ApiResponse<bool>> delete(int id) async {
    return api.delete('${UrlConstant.address}/$id', (data) => data);
  }

  Future<ApiResponse> setDefaultAddress(int id) async {
    return api.patch(
      '${UrlConstant.address}/$id',
      (data) => data,
      data: {'isDefault': true},
    );
  }

  Future<ApiResponse<AddressDto>> getById(String id) async {
    return api.get(
      '${UrlConstant.address}/$id',
      (address) => AddressDto.fromJson(address),
    );
  }

  Future<ApiResponse> createOrUpdate(AddressDto addressDto) async {
    final int id = addressDto.id;
    if (id == 0) {
      return api.post(
        UrlConstant.address,
        (data) => data,
        data: addressDto.toJson(),
      );
    }
    return api.patch(
      '${UrlConstant.address}/${addressDto.id}',
      (data) => data,
      data: addressDto.toJson(),
    );
  }
}
