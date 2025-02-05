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
  Gender gender;
  String phoneNo;

  UserDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phoneNo,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        gender: json["gender"],
        phoneNo: json["phoneNo"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "gender": gender,
        "phoneNo": phoneNo,
      };
}
