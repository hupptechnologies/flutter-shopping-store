import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/data/address/address_dto.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var selectedAddressId = 1.obs;
  final List<AddressDto> list = [
    AddressDto(
      id: 1,
      firstName: 'Sunie',
      lastName: 'Pham',
      city: 'city',
      state: 'state',
      country: 'country',
      streetName: 'streetName',
      phoneNumber: '+91 0000000000',
      zipCode: '000000',
      type: AddressEnum.home,
      isSelected: true,
    ),
    AddressDto(
      id: 2,
      firstName: 'Sunie',
      lastName: 'Pham',
      city: 'city',
      state: 'state',
      country: 'country',
      streetName: 'streetName',
      phoneNumber: '+91 0000000000',
      zipCode: '000000',
      type: AddressEnum.office,
    )
  ].obs;

  void onChangeDefalutAddress(int id) {
    selectedAddressId.value = id;
    for (var address in list) {
      address.isSelected = address.id == id;
    }
    update();
  }
}
