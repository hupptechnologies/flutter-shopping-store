import 'dart:convert';

import 'package:e_commerce/common/enum/gender_enum.dart';

List<UserDto> userDtoFromJson(String str) =>
    List<UserDto>.from(json.decode(str).map((x) => UserDto.fromJson(x)));

String userDtoToJson(List<UserDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDto {
  String firstName;
  String lastName;
  String email;
  String? mobileNumber;
  String? image;
  Gender? gender;

  UserDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.mobileNumber,
    this.image,
    this.gender,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        image: json["image"],
        gender:
            json["gender"] != null ? genderFromString(json["gender"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNumber": mobileNumber,
        "gender": gender.toString().split('.').last,
      };
}

Gender genderFromString(String gender) {
  switch (gender.toLowerCase()) {
    case "male":
      return Gender.male;
    case "female":
      return Gender.female;
    case "other":
      return Gender.other;
    default:
      throw Exception("Invalid gender value: $gender");
  }
}