import 'dart:convert';

List<UserDto> userDtoFromJson(String str) =>
    List<UserDto>.from(json.decode(str).map((x) => UserDto.fromJson(x)));

String userDtoToJson(List<UserDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDto {
  String firstName;
  String lastName;
  String email;
  String? mobileNumber;

  UserDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.mobileNumber,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      mobileNumber: json["mobileNumber"]);

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobileNumber": mobileNumber
      };
}
