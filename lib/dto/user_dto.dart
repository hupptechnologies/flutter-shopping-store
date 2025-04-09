import 'dart:convert';

import 'package:e_commerce/common/enum/gender_enum.dart';
import 'package:e_commerce/common/utils/helper.dart';

List<UserDto> userDtoFromJson(String str) =>
    List<UserDto>.from(json.decode(str).map((x) => UserDto.fromJson(x)));

String userDtoToJson(List<UserDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDto {
  int id;
  String firstName;
  String lastName;
  String email;
  String? mobileNumber;
  String? image;
  Gender? gender;

  UserDto({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.mobileNumber,
    this.image,
    this.gender,
  });

  void update({
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    Gender? gender,
  }) {
    if (firstName != null) this.firstName = firstName;
    if (lastName != null) this.lastName = lastName;
    if (email != null) this.email = email;
    if (mobileNumber != null) this.mobileNumber = mobileNumber;
    if (gender != null) this.gender = gender;
  }

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"] ?? '',
        mobileNumber: json["mobileNumber"],
        image: json["image"],
        gender: json["gender"] != null
            ? Helper.enumFromString(json["gender"], Gender.values)
            : null,
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNumber": mobileNumber,
        "gender": gender.toString().split('.').last,
      };

  String get fullName => '$firstName $lastName';
}
