class AddressDto {
  String firstName = '';
  String lastName = '';
  String streetName = '';
  String country = '';
  String city = '';
  String state = '';
  String zipCode = '';
  String phoneNumber = '';

  bool get isValid =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      streetName.isNotEmpty &&
      country.isNotEmpty &&
      city.isNotEmpty &&
      state.isNotEmpty &&
      zipCode.isNotEmpty &&
      phoneNumber.isNotEmpty;

  Map<String, String> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'streetName': streetName,
      'city': city,
      'country': country,
      'state': state,
      'zipCode': zipCode,
      'phoneNumber': phoneNumber,
    };
  }

  void updateField(String key, String value) {
    switch (key) {
      case 'firstName':
        firstName = value;
        break;
      case 'lastName':
        lastName = value;
        break;
      case 'streetName':
        streetName = value;
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
      case 'phoneNumber':
        phoneNumber = value;
        break;
    }
  }
}
