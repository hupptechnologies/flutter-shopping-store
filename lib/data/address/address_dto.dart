import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/common/utils/helper.dart';

List<AddressDto> addressDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => AddressDto.fromJson(json)).toList();
}

class AddressDto {
  int id = 0;
  String receiverName = '';
  String street = '';
  String country = '';
  String city = '';
  String state = '';
  String zipCode = '';
  String receiverPhone = '';
  AddressEnum type;
  bool isDefault = false;

  AddressDto({
    this.id = 0,
    this.receiverName = '',
    this.street = '',
    this.country = '',
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.receiverPhone = '',
    this.type = AddressEnum.home,
    this.isDefault = false,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) => AddressDto(
        id: json["id"],
        receiverName: json["receiverName"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        country: json["country"],
        type: Helper.enumFromString(json["type"], AddressEnum.values),
        receiverPhone: json["receiverPhone"],
        isDefault: json["isDefault"],
      );

  bool get isValid =>
      street.isNotEmpty &&
      country.isNotEmpty &&
      city.isNotEmpty &&
      state.isNotEmpty &&
      zipCode.isNotEmpty &&
      receiverPhone.isNotEmpty;

  Map<String, String> toJson() {
    return {
      'receiverName': receiverName,
      'street': street,
      'city': city,
      'country': country,
      'state': state,
      'zipCode': zipCode,
      'receiverPhone': receiverPhone,
    };
  }

  void updateField(String key, String value) {
    switch (key) {
      case 'street':
        street = value;
        break;
      case 'country':
        country = value;
        break;
      case 'city':
        city = value;
        break;
      case 'state':
        state = value;
        break;
      case 'zipCode':
        zipCode = value;
        break;
      case 'receiverPhone':
        receiverPhone = value;
        break;
    }
  }

  String getAddressLine() {
    return '$street, $city, $state - $zipCode, $country';
  }
}
